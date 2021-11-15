import 'package:bpp_riverpod/app/api/api_provider.dart';
import 'package:bpp_riverpod/app/api/reservation_client.dart';
import 'package:bpp_riverpod/app/api/review_client.dart';
import 'package:bpp_riverpod/app/model/mypage/mypage_response.dart';
import 'package:bpp_riverpod/app/model/mypage/reservation_request.dart';
import 'package:bpp_riverpod/app/model/review/review.dart';
import 'package:bpp_riverpod/app/model/review/review_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mypageRepsitory = Provider<MypageRepository>((ref) {
  final reservationClient = ref.watch(reservationClientProvider);
  final reviewClient = ref.watch(reviewClientProvider);
  return MypageRepository(
      reservationClient: reservationClient, reviewClient: reviewClient);
});

class MypageRepository {
  MypageRepository({
    required this.reservationClient,
    required this.reviewClient,
  });

  final ReservationClient reservationClient;
  final ReviewClient reviewClient;

  // 샵 문의 중 조회
  Future<MypageResponse> getShopInquiring() async {
    final response = await reservationClient.getShopReservations(true);
    return response;
  }

  // 샵 확정/만료 조회
  Future<MypageResponse> getShopReservation() async {
    final response = await reservationClient.getShopReservations(false);
    return response;
  }

  // 확정날짜 받기
  Future<dynamic> setReservationDate(int id, String date) async {
    final response = await reservationClient.setShopReservationDate(
        id, ReservationRequest(date: date));
    return response;
  }

  // 문의중 삭제
  Future<dynamic> deleteInquiring(int id) async {
    final response = await reservationClient.deleteShopReservation(id);
    return response;
  }

  // 리뷰  작성
  Future<dynamic> createReview(int id, int score, String? text) async {
    final response = await reviewClient.createReview(
      id,
      ReviewRequest(
        score: score,
        contents: text,
      ),
    );
    return response;
  }

  // 리뷰 수정
  Future<ReviewDetail> updateReview(int id, String text) async {
    final reviewDetail =
        await reviewClient.updateReview(id, ReviewRequest(contents: text));
    return reviewDetail;
  }

  // 리뷰 삭제
  Future<dynamic> deleteReview(int id) async {
    final response = await reviewClient.deleteReview(id);
    return response;
  }
}
