import 'package:bpp_riverpod/app/model/review/review.dart';
import 'package:bpp_riverpod/app/model/review/review_list.dart';
import 'package:bpp_riverpod/app/model/shop/shop_concept.dart';
import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/model/shop/shop_detail_data.dart';
import 'package:bpp_riverpod/app/model/shop/shop_list.dart';
import 'package:bpp_riverpod/app/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopRepositroyProvider =
    Provider<ShopRepository>((ref) => StudioRepository());

final beautyRepositroyProvider =
    Provider<ShopRepository>((ref) => BeautyRepository());

final tanningRepositroyProvider =
    Provider<ShopRepository>((ref) => TanningRepository());

final waxingRepositroyProvider =
    Provider<ShopRepository>((ref) => WaxingRepository());

abstract class ShopRepository {
  // 샵 조회
  Future<ShopList> getShopList();

  // 좋아요
  Future<void> setLike(int id);

  Future<ShopDetailData> getShopDetailData(int shopId);
  Future<ShopConcepts> getShopConcepts();
  Future<ReviewList> getReviews();
}

class StudioRepository implements ShopRepository {
  @override
  Future<ShopList> getShopList() async {
    await Future.delayed(const Duration(seconds: 1));
    return ShopList(
      shopDatas: List.generate(
        40,
        (index) => ShopData(
          id: index,
          name: 'StudioShop $index',
          address: '서울시 관악구',
          like: false,
          minPrice: 200000,
          profile:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSWX2EtpNdJxN2rTqCYLjdfjJA2TCZSem-jw&usqp=CAU',
        ),
      ),
      next: 'true',
    );
  }

  @override
  Future<void> setLike(int id) {
    throw UnimplementedError();
  }

  @override
  Future<ReviewList> getReviews() async {
    await Future.delayed(const Duration(seconds: 1));
    return ReviewList(
      reviews: List.generate(
        20,
        (index) => Review(
          id: index,
          user: User(id: 1, userName: '김**'),
          date: '21.09.26',
          score: 4,
          contents: '바프 너무 좋아요',
        ),
      ),
      next: 'true',
    );
  }

  @override
  Future<ShopDetailData> getShopDetailData(int shopId) async {
    await Future.delayed(const Duration(seconds: 1));
    return ShopDetailData(
      id: 1,
      name: 'Shop',
      logo:
          'https://png.pngtree.com/png-clipart/20200727/original/pngtree-photography-studio-logo-template-png-image_5392695.jpg',
      like: false,
      kakaoUrl: 'https://pf.kakao.com/_xgCxjfj',
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
  Future<ShopList> getShopList() async {
    await Future.delayed(const Duration(seconds: 1));
    return ShopList(
      shopDatas: List.generate(
        40,
        (index) => ShopData(
          id: index,
          name: 'Beautyshop $index',
          address: '서울시 관악구',
          like: false,
          minPrice: 300000,
          profile:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQkgt7DDEnw1KJd_DfIaMYFPCEJT1q4iAAmw&usqp=CAU',
        ),
      ).toList(),
    );
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

  @override
  Future<ReviewList> getReviews() {
    // TODO: implement getReviews
    throw UnimplementedError();
  }
}

class WaxingRepository implements ShopRepository {
  @override
  Future<ShopDetailData> getShopDetailData(int shopId) {
    // TODO: implement getShopDetailData
    throw UnimplementedError();
  }

  @override
  Future<ShopList> getShopList() async {
    await Future.delayed(const Duration(seconds: 1));
    return ShopList(
      shopDatas: List.generate(
        40,
        (index) => ShopData(
          id: index,
          name: 'WaxingShop $index',
          address: '서울시 관악구',
          like: false,
          minPrice: 50000,
          profile:
              'https://mblogthumb-phinf.pstatic.net/MjAyMDEwMDNfMTM2/MDAxNjAxNzEwODIyNDA4.mwf07nNjhNGpLnEkdj2s8NOjGiEoSdtWudZ8J1H2aFcg.-SyUA0hcggrQ7EsoB9jnHcbgTtM4q5hDvUSsTzm6APMg.JPEG.enway85/%EC%9D%B8%EC%8A%A4%ED%83%80%EC%9A%A9_(5).jpg?type=w800',
        ),
      ).toList(),
    );
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

  @override
  Future<ReviewList> getReviews() {
    // TODO: implement getReviews
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
  Future<ShopList> getShopList() async {
    await Future.delayed(const Duration(seconds: 1));
    return ShopList(
      shopDatas: List.generate(
        40,
        (index) => ShopData(
          id: index,
          name: 'TanningShop $index',
          address: '서울시 관악구',
          like: false,
          minPrice: 150000,
          profile: 'https://i.ytimg.com/vi/3odYULFS_28/maxresdefault.jpg',
        ),
      ).toList(),
    );
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

  @override
  Future<ReviewList> getReviews() {
    // TODO: implement getReviews
    throw UnimplementedError();
  }
}
