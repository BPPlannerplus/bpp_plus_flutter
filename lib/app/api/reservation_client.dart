import 'package:bpp_riverpod/app/model/mypage/mypage_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'reservation_client.g.dart';

@RestApi(
    baseUrl: 'http://ec2-54-180-83-124.ap-northeast-2.compute.amazonaws.com')
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
  Future<dynamic> setShopReservation(
    @Path() int shopId,
  );

  @PATCH('/reservations/{id}')
  Future<dynamic> setShopReservationDate(
    @Path() int reservationId,
    @Body() Map<String, dynamic> date,
  );

  @DELETE('/reservations/{id}')
  Future<dynamic> deleteShopReservation(
    @Path() int id,
  );
}
