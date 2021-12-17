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
    final response = await repository.checkReservation();
    final lists = await repository.getShopReservation();
    state = lists.list.where((e) => e.state == 1).toList();
    read(isConfirmedLoading.state).state = false;
    return state;
  }

  Future<dynamic> deleteById(int shopId) async {
    state = state.where((e) => e.id != shopId).toList();
    final response = await repository.deleteInquiring(shopId);
    return response;
  }

  List<List<MypageData>> makeList() {
    state.sort((a, b) {
      final aa = DateTime.parse(a.reservedData!);
      final bb = DateTime.parse(b.reservedData!);
      return bb.difference(aa).inDays;
    });
    Set<String> dates = state.map((e) => e.reservedData!).toSet();
    List<List<MypageData>> dateList = [];
    for (String date in dates) {
      List<MypageData> rd = state.where((e) => e.reservedData == date).toList();
      dateList.add(rd);
    }
    return dateList.reversed.toList();
  }

  void changeState(int shopId) {
    state = state.where((e) => e.id != shopId).toList();
  }

  void changeDateState(int shopId, String date) {
    state = state.map((e) {
      if (e.id == shopId) {
        return e.copyWith(reservedData: date);
      }
      return e;
    }).toList();
  }
}
