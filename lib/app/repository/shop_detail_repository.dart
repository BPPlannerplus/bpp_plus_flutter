import 'package:bpp_riverpod/app/model/review/review.dart';
import 'package:bpp_riverpod/app/model/review/review_list.dart';
import 'package:bpp_riverpod/app/model/shop/shop_concept.dart';
import 'package:bpp_riverpod/app/model/shop/shop_detail_data.dart';
import 'package:bpp_riverpod/app/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopDetailRepository =
    Provider<ShopDetailReposiroty>((ref) => FakeShopDetailRepository());

abstract class ShopDetailReposiroty {
  // 샵 디테일 정보
  Future<ShopDetailData> getShopDetail();

  // 좋아요
  Future<void> setLike();

  // 샵 포트폴리오 정보
  Future<ShopConcepts> getShopConcepts();

  // 샵 리뷰 정보
  Future<ReviewList> getShopReviews();

  // 샵 예약
  Future<void> shopReservation();

  // 리뷰 신고
  Future<void> reportReview();
}

class FakeShopDetailRepository implements ShopDetailReposiroty {
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

  @override
  Future<ShopDetailData> getShopDetail() async {
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
  Future<ReviewList> getShopReviews() async {
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
  Future<void> reportReview() {
    // TODO: implement reportReview
    throw UnimplementedError();
  }

  @override
  Future<void> setLike() {
    // TODO: implement setLike
    throw UnimplementedError();
  }

  @override
  Future<void> shopReservation() {
    // TODO: implement shopReservation
    throw UnimplementedError();
  }
}
