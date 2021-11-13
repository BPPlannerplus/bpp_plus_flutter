import 'package:bpp_riverpod/app/model/review/complain.dart';
import 'package:bpp_riverpod/app/model/review/review.dart';
import 'package:bpp_riverpod/app/model/review/review_detail.dart';
import 'package:bpp_riverpod/app/model/review/review_list.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'review_client.g.dart';

@RestApi(
    baseUrl: 'http://ec2-54-180-83-124.ap-northeast-2.compute.amazonaws.com')
abstract class ReviewClient {
  factory ReviewClient(
    Dio dio, {
    String? baseUrl,
  }) = _ReviewClient;

  @GET('/reviews/shops/{id}')
  Future<ReviewList> getReviews(
    @Path() int shopId,
  );

  @POST('/reviews/shops/{id}')
  Future<dynamic> createReview(
    @Path() int shopId,
    @Body() ReviewRequest reviewRequest,
  );

  @GET('/reviews/{id}')
  Future<ReviewDetail> getReview(
    @Path() int reviewId,
  );

  @PATCH('/reviews/{id}')
  Future<dynamic> updateReview(
    @Path() int reviewId,
    @Body() ReviewRequest reviewRequest,
  );

  @DELETE('/reviews/{id}')
  Future<dynamic> deleteReview(
    @Path() int reviewId,
  );

  @POST('/reviews/{id}/complains')
  Future<dynamic> reportReview(
    @Path() int reviewId,
    @Body() Complain complain,
  );
}
