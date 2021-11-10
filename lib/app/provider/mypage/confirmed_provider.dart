import 'package:bpp_riverpod/app/model/mypage/mypage_data.dart';
import 'package:bpp_riverpod/app/repository/mypage_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isConfirmedLoading = StateProvider.autoDispose<bool>((ref) => true);

final confirmedListProvider =
    StateNotifierProvider.autoDispose<ConfirmedList, List<MypageData>>((ref) {
  final repository = ref.watch(mypageRepsitory);
  return ConfirmedList(
    repository: repository,
    read: ref.read,
  );
});

class ConfirmedList extends StateNotifier<List<MypageData>> {
  ConfirmedList({
    required this.repository,
    required this.read,
  }) : super([]);

  final MypageRepository repository;
  final Reader read;

  Future<List<MypageData>> getList() async {
    read(isConfirmedLoading.state).state = true;
    final lists = await repository.getShopReservation();
    state = lists.list.where((e) => e.state == 1).toList();
    state.sort((a, b) {
      final aa = DateTime.parse(a.reservedData);
      final bb = DateTime.parse(b.reservedData);
      return bb.difference(aa).inDays;
    });
    read(isConfirmedLoading.state).state = false;
    return state;
  }

  void setDate(int shopId) {}

  void deleteById(int shopId) {
    state = state.where((e) => e.id != shopId).toList();
  }

  List<List<MypageData>> makeList() {
    Set<String> dates = state.map((e) => e.reservedData).toSet();
    List<List<MypageData>> dateList = [];
    for (String date in dates) {
      List<MypageData> rd = state.where((e) => e.reservedData == date).toList();
      dateList.add(rd);
    }
    return dateList.reversed.toList();
  }
}
