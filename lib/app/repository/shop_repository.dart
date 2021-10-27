import 'package:bpp_riverpod/app/model/shop_concept.dart';
import 'package:bpp_riverpod/app/model/shop_data.dart';
import 'package:bpp_riverpod/app/model/shop_detail_data.dart';
import 'package:bpp_riverpod/app/model/shop_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopRepositroyProvider =
    Provider<FakeShopRepositroy>((ref) => FakeShopRepositroy());

abstract class ShopRepository {
  Future<ShopList> getShopList();
  Future<void> setLike(int id);
  Future<ShopDetailData> getShopDetailData(int shopId);
  Future<ShopConcepts> getShopConcepts();
}

class FakeShopRepositroy implements ShopRepository {
  @override
  Future<ShopDetailData> getShopDetailData(int shopId) async {
    await Future.delayed(const Duration(seconds: 1));
    return ShopDetailData(
      id: 1,
      name: 'Shop',
      logo:
          'https://png.pngtree.com/png-clipart/20200727/original/pngtree-photography-studio-logo-template-png-image_5392695.jpg',
      like: false,
      kakaoUrl: 'kakaoUrl',
      address: '서울특별시 관악구 봉천동~',
      profiles: [
        'https://modo-phinf.pstatic.net/20210107_257/1610007835482y4K17_JPEG/mosafm00Fx.jpeg?type=f540_540',
        'https://cphoto.asiae.co.kr/listimglink/6/2021032213224143007_1616386962.jpg',
        'http://img.marieclairekorea.com/2020/10/mck_5f914e9354384-562x781.png',
      ],
      mapImg:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVxXilxiRLh_dciqE35zNWPAidDcwYJi9yDA&usqp=CAU',
      minPrice: 200000,
      priceImg:
          'https://blog.kakaocdn.net/dn/bqfBRF/btqZJ6f7AXT/IBU2g4XhyNK4UJ7K5Xyam0/img.jpg',
      partnershipList: List.generate(
        10,
        (index) => PartnershipData(
          id: index,
          name: '제휴업체 $index',
          profile:
              'https://cdn.imweb.me/upload/S20200731435c95ee6d424/24456b4049369.jpg',
        ),
      ),
    );
  }

  @override
  Future<ShopList> getShopList() async {
    await Future.delayed(const Duration(seconds: 1));
    return ShopList(
      shopDatas: List.generate(
        40,
        (index) => ShopData(
          id: index,
          name: 'Shop $index',
          address: '서울시 관악구',
          like: false,
          minPrice: 200000,
          profile:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSWX2EtpNdJxN2rTqCYLjdfjJA2TCZSem-jw&usqp=CAU',
        ),
      ).toList(),
    );
  }

  @override
  Future<void> setLike(int id) {
    throw UnimplementedError();
  }

  @override
  Future<ShopConcepts> getShopConcepts() async {
    await Future.delayed(const Duration(seconds: 1));
    return ShopConcepts(
      shopConcepts: List.generate(
        30,
        (index) => ShopConcept(
          id: index,
          profile:
              'https://contents.sixshop.com/thumbnails/uploadedFiles/23404/post/image_1610172843905_1000.png',
        ),
      ),
      next: 'true',
    );
  }
}

class BeautyRepository implements ShopRepository {
  @override
  Future<ShopDetailData> getShopDetailData(int shopId) {
    // TODO: implement getShopDetailData
    throw UnimplementedError();
  }

  @override
  Future<ShopList> getShopList() {
    // TODO: implement getShopList
    throw UnimplementedError();
  }

  @override
  Future<void> setLike(int id) {
    // TODO: implement setLike
    throw UnimplementedError();
  }

  @override
  Future<ShopConcepts> getShopConcepts() {
    // TODO: implement getShopConcepts
    throw UnimplementedError();
  }
}

class WaxingRepostiry implements ShopRepository {
  @override
  Future<ShopDetailData> getShopDetailData(int shopId) {
    // TODO: implement getShopDetailData
    throw UnimplementedError();
  }

  @override
  Future<ShopList> getShopList() {
    // TODO: implement getShopList
    throw UnimplementedError();
  }

  @override
  Future<void> setLike(int id) {
    // TODO: implement setLike
    throw UnimplementedError();
  }

  @override
  Future<ShopConcepts> getShopConcepts() {
    // TODO: implement getShopConcepts
    throw UnimplementedError();
  }
}

class TanningRepository implements ShopRepository {
  @override
  Future<ShopDetailData> getShopDetailData(int shopId) {
    // TODO: implement getShopDetailData
    throw UnimplementedError();
  }

  @override
  Future<ShopList> getShopList() {
    // TODO: implement getShopList
    throw UnimplementedError();
  }

  @override
  Future<void> setLike(int id) {
    // TODO: implement setLike
    throw UnimplementedError();
  }

  @override
  Future<ShopConcepts> getShopConcepts() {
    // TODO: implement getShopConcepts
    throw UnimplementedError();
  }
}
