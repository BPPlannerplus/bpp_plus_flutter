import 'package:bpp_riverpod/app/model/mypage/mypage_data.dart';
import 'package:bpp_riverpod/app/repository/mypage_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isExpirationLoading = StateProvider.autoDispose<bool>((ref) => true);

final expirationListProvider =
    StateNotifierProvider.autoDispose<ExpirationList, List<MypageData>>((ref) {
  final repository = ref.watch(mypageRepsitory);
  return ExpirationList(
    repository: repository,
    read: ref.read,
  );
});

class ExpirationList extends StateNotifier<List<MypageData>> {
  ExpirationList({
    required this.repository,
    required this.read,
  }) : super([]);

  final MypageRepository repository;
  final Reader read;

  Future<List<MypageData>> getList() async {
    read(isExpirationLoading.state).state = true;
    final lists = await repository.getShopReservation();

    state = lists.list.where((e) => e.state == 2 || e.state == 3).toList();
    state.sort((a, b) {
      final aa = DateTime.parse(a.reservedData!);
      final bb = DateTime.parse(b.reservedData!);
      return bb.difference(aa).inDays;
    });
    read(isExpirationLoading.state).state = false;
    return state;
  }

  void changeShopState(int reservationId) {
    state = state.map((e) {
      if (e.id == reservationId) {
        return e.copyWith(state: 3);
      }
      return e;
    }).toList();
  }
}
