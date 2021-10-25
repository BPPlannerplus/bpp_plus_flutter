import 'package:bpp_riverpod/app/model/like.dart';
import 'package:bpp_riverpod/app/model/shop_concept.dart';
import 'package:bpp_riverpod/app/model/shop_detail_data.dart';
import 'package:bpp_riverpod/app/model/shop_list.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'shop_client.g.dart';

@RestApi(baseUrl: "http://localhose:8080")
abstract class ShopClient {
  factory ShopClient(
    Dio dio, {
    String baseUrl,
  }) = _ShopClient;

  @GET("/shops/studios/")
  Future<ShopList> getStudioList(
    @Query('page') int page,
    @Query('like') bool like,
    @Query('address') List<String>? address,
  );

  @GET("/shops/beautyshops/")
  Future<ShopList> getBeautyList(
    @Query('page') int page,
    @Query('like') bool like,
    @Query('address') List<String>? address,
  );

  @GET("/shops/{id}")
  Future<ShopDetailData> getShopData(
    @Path('id') int id,
  );

  @GET("/shops/{id}/concepts")
  Future<ShopConcepts> getShopConcepts(
    @Path('id') int id,
    @Query('page') int page,
  );

  @PUT("/shops/{id}/like")
  Future<LikeResponse> setLike(
    @Path('id') int id,
    @Body() LikeRequest like,
  );
}