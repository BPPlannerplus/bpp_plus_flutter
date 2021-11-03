import 'package:bpp_riverpod/app/model/review/review_list.dart';
import 'package:bpp_riverpod/app/model/shop/shop_concept.dart';
import 'package:bpp_riverpod/app/model/shop/shop_detail_data.dart';

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
