import 'package:bpp_riverpod/app/model/enum/shop_type.dart';
import 'package:bpp_riverpod/app/model/mypage/mypage_data.dart';
import 'package:bpp_riverpod/app/repository/mypage_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isInquiryLoading = StateProvider.autoDispose<bool>((ref) => true);

final isInquiryEmptyProvider = Provider.autoDispose<bool>((ref) {
  final shopDatas = ref.watch(inquiryListProvider);
  return shopDatas.isEmpty;
});

final inquiryShopTypeProvider =
    StateProvider.autoDispose<ShopType>((ref) => ShopType.studio);

final inquiryListProvider =
    StateNotifierProvider.autoDispose<InquiryList, List<MypageData>>((ref) {
  final repository = ref.watch(mypageRepsitory);
  return InquiryList(
    repository: repository,
    read: ref.read,
  );
});

class InquiryList extends StateNotifier<List<MypageData>> {
  InquiryList({
    required this.repository,
    required this.read,
  }) : super([]);

  final MypageRepository repository;
  final Reader read;

  Future<List<MypageData>> getList() async {
    read(isInquiryLoading.state).state = true;
    final lists = await repository.getShopInquiring();
    state = lists.list;
    read(isInquiryLoading.state).state = false;
    return state;
  }

  Future<dynamic> setDate(int shopId, String date) async {
    final response = await repository.setReservationDate(shopId, date);
    return response;
  }

  Future<dynamic> deleteByShopType(ShopType shopType) async {
    state = state
        .where(
          (element) => element.shop.type != shopType.index,
        )
        .toList();
    final response =
        await repository.deleteReservationByShopType(shopType.name);
    return response;
  }

  Future<dynamic> deleteById(int shopId) async {
    state = state.where((e) => e.id != shopId).toList();

    final response = await repository.deleteInquiring(shopId);
    return response;
  }

  void changeState(int shopId, String date) {
    state = state.where((e) => e.id != shopId).toList();
  }
}
