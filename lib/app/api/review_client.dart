import 'package:bpp_riverpod/app/model/review/complain.dart';
import 'package:bpp_riverpod/app/model/review/review.dart';
import 'package:bpp_riverpod/app/model/review/review_detail.dart';
import 'package:bpp_riverpod/app/model/review/review_list.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'review_client.g.dart';

@RestApi(baseUrl: 'http://localhose:8080')
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
  Future<void> createReview(
    @Path() int shopId,
    @Body() ReviewRequest reviewRequest,
  );

  @GET('/reviews/{id}')
  Future<ReviewDetail> getReview(
    @Path() int reviewId,
  );

  @PATCH('/reviews/{id}')
  Future<void> updateReview(
    @Path() int reviewId,
    @Body() ReviewRequest reviewRequest,
  );

  @DELETE('/reviews/{id}')
  Future<void> deleteReview(
    @Path() int reviewId,
  );

  @POST('/reviews/{id}/complains')
  Future<void> reportReview(
    @Path() int reviewId,
    @Body() Complain complain,
  );
}
