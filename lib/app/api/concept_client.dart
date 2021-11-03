import 'package:bpp_riverpod/app/model/concept/concept_list.dart';
import 'package:bpp_riverpod/app/model/like.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'concept_client.g.dart';

@RestApi(baseUrl: "http://localhose:8080")
abstract class ConceptClient {
  factory ConceptClient(
    Dio dio, {
    String baseUrl,
  }) = _ConceptClient;

  @GET("/concept/studios/")
  Future<ConceptList> getStudioList(
    @Query('page') int page,
    @Query('head_count') String headCount,
    @Query('gender') String gender,
    @Query('background') String background,
    @Query('prop') String prop,
    @Query('dress') String dress,
    @Query('like') bool? like,
  );

  @PUT("/concept/studios/{id}/like")
  Future<LikeResponse> setLike(
    @Path('id') int id,
    @Body() LikeRequest like,
  );
}