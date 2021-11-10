import 'package:bpp_riverpod/app/model/mypage/mypage_shop_data.dart';
import 'package:bpp_riverpod/app/repository/mypage_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isConfirmdLoading = StateProvider.autoDispose<bool>((ref) => false);

final inquiryListProvider =
    StateNotifierProvider.autoDispose<ConfirmedList, List<MypageShopData>>(
        (ref) {
  final repository = ref.watch(mypageRepsitory);
  return ConfirmedList(
    repository: repository,
    read: ref.read,
  );
});

class ConfirmedList extends StateNotifier<List<MypageShopData>> {
  ConfirmedList({
    required this.repository,
    required this.read,
  }) : super([]);

  final MypageRepository repository;
  final Reader read;

  Future<List<MypageShopData>> getList() async {
    read(isConfirmdLoading.state).state = true;
    final lists = await repository.getShopInquiring();
    state = lists.list.map<MypageShopData>((e) => e.shop).toList();
    read(isConfirmdLoading.state).state = false;
    return state;
  }

  void setDate(int shopId) {}

  void deleteById(int shopId) {
    state = state.where((e) => e.id != shopId).toList();
  }
}
