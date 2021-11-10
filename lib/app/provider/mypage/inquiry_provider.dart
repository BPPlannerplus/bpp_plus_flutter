import 'package:bpp_riverpod/app/model/mypage/mypage_shop_data.dart';
import 'package:bpp_riverpod/app/repository/mypage_repository.dart';
import 'package:bpp_riverpod/app/util/enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isInquiryLoading = StateProvider.autoDispose<bool>((ref) => true);

final isInquiryEmptyProvider = Provider.autoDispose<bool>((ref) {
  final shopDatas = ref.watch(inquiryListProvider);
  return shopDatas.isEmpty;
});

final inquiryShopTypeProvider =
    StateProvider.autoDispose<ShopType>((ref) => ShopType.stduio);

final inquiryListProvider =
    StateNotifierProvider.autoDispose<InquiryList, List<MypageShopData>>((ref) {
  final repository = ref.watch(mypageRepsitory);
  return InquiryList(
    repository: repository,
    read: ref.read,
  );
});

class InquiryList extends StateNotifier<List<MypageShopData>> {
  InquiryList({
    required this.repository,
    required this.read,
  }) : super([]);

  final MypageRepository repository;
  final Reader read;

  Future<List<MypageShopData>> getList() async {
    read(isInquiryLoading.state).state = true;
    final lists = await repository.getShopInquiring();
    state = lists.list.map<MypageShopData>((e) => e.shop).toList();
    read(isInquiryLoading.state).state = false;
    return state;
  }

  void setDate(int shopId) {}

  void deleteAll(ShopType shopType) {
    state = state.where((e) => e.type != shopType.index).toList();
  }

  void deleteById(int shopId) {
    state = state.where((e) => e.id != shopId).toList();
  }
}
