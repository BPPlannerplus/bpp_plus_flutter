import 'package:bpp_riverpod/app/model/concept/concept_list.dart';
import 'package:bpp_riverpod/app/model/like.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'concept_client.g.dart';

@RestApi(
    baseUrl: "http://ec2-54-180-83-124.ap-northeast-2.compute.amazonaws.com")
abstract class ConceptClient {
  factory ConceptClient(
    Dio dio, {
    String baseUrl,
  }) = _ConceptClient;

  @GET("/concepts/studios/")
  Future<ConceptList> getStudioList(
    @Query('page') int page,
    @Query('like') bool like,
    @Query('head_count') List<String>? headCount,
    @Query('gender') List<String>? gender,
    @Query('background') List<String>? background,
    @Query('prop') List<String>? prop,
    @Query('dress') List<String>? dress,
  );

  @PUT("/concepts/studios/{id}/like")
  Future<dynamic> setLike(
    @Path('id') int id,
    @Body() LikeRequest like,
  );
}
