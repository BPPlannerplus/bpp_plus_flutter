import 'package:bpp_riverpod/app/model/mypage/mypage_response.dart';
import 'package:bpp_riverpod/app/model/mypage/reservation_request.dart';
import 'package:bpp_riverpod/app/model/review/review.dart';
import 'package:bpp_riverpod/app/model/review/review_detail.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'reservation_client.g.dart';

@RestApi(baseUrl: 'https://bpplaner.shop')
abstract class ReservationClient {
  factory ReservationClient(
    Dio dio, {
    String? baseUrl,
  }) = _ReservationClient;

  //  샵 예약내역 조회
  @GET('/reservations/')
  Future<MypageResponse> getShopReservations(
    @Query('inquiry') bool inquiry,
  );

  // 샵 문의중 추가
  @POST('/reservations/shops/{id}')
  Future<dynamic> setShopReservation(
    @Path() int id,
  );

  //  확정날짜
  @PATCH('/reservations/{id}')
  Future<dynamic> setShopReservationDate(
    @Path() int id,
    @Body() ReservationRequest date,
  );

  //  문의중 취소
  @DELETE('/reservations/{id}')
  Future<dynamic> deleteShopReservation(
    @Path() int id,
  );

  //  문의중 전체 삭제
  @DELETE('/reservations/')
  Future<dynamic> deleteReservationByShopType(
    @Query('shop_type') String shopType,
  );

  // 특정 예약의 리뷰 조회
  @GET('/reservations/{id}/reviews')
  Future<ReviewDetail> getReview(
    @Path() int id,
  );

  // 특정 예약의 리뷰 추가
  @POST('/reservations/{id}/reviews/')
  Future<dynamic> createReview(
    @Path() int id,
    @Body() ReviewRequest reviewRequest,
  );
}
