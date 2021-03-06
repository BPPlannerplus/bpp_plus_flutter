import 'package:bpp_riverpod/app/model/review/complain.dart';
import 'package:bpp_riverpod/app/model/review/review_detail.dart';
import 'package:bpp_riverpod/app/model/review/review_list.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'review_client.g.dart';

@RestApi(baseUrl: 'https://bpplaner.shop')
abstract class ReviewClient {
  factory ReviewClient(
    Dio dio, {
    String? baseUrl,
  }) = _ReviewClient;

  @GET('/reviews/shops/{id}')
  Future<ReviewList> getReviews(
    @Path() int id,
  );

  @PATCH('/reviews/{id}')
  Future<ReviewDetail> updateReview(
    @Path() int id,
    @Body() ReviewContent reviewContent,
  );

  @POST('/reviews/{id}/complains/')
  Future<dynamic> reportReview(
    @Path() int id,
    @Body() Complain complain,
  );
}
