import 'package:bpp_riverpod/app/model/mypage/mypage_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'reservation_client.g.dart';

@RestApi(baseUrl: 'http://localhose:8080')
abstract class ReservationClient {
  factory ReservationClient(
    Dio dio, {
    String? baseUrl,
  }) = _ReservationClient;

  @GET('/reservations/')
  Future<MypageResponse> getShopReservations(
    @Query('inquiry') bool inquiry,
  );

  @POST('/reservations/shops/{id}')
  Future<void> setShopReservation(
    @Path() int shopId,
  );

  @PATCH('/reservations/{id}')
  Future<void> setShopReservationDate(
    @Path() int reservationId,
  );

  @DELETE('/reservations/{id}')
  Future<void> deleteShopReservation(
    @Path() int id,
  );
}
