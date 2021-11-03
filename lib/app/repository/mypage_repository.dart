import 'package:bpp_riverpod/app/model/mypage/mypage_response.dart';

abstract class MypageRepository {
  // 샵 문의 중 조회
  Future<MypageResponse> getShopInquiring();

  // 샵 확정 조회
  Future<MypageResponse> getShopConfirmation();

  // 확정날짜 받기
  Future<void> setReservationDate();

  // 문의중 삭제
  Future<void> deleteInquiring();

  // 리뷰  작성
  Future<void> createReview();

  // 리뷰 수정
  Future<void> updateReview();

  // 리뷰 삭제
  Future<void> deleteReview();
}
