import 'package:bpp_riverpod/app/model/like.dart';
import 'package:bpp_riverpod/app/model/shop/shop_concept.dart';
import 'package:bpp_riverpod/app/model/shop/shop_detail_data.dart';
import 'package:bpp_riverpod/app/model/shop/shop_list.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'shop_client.g.dart';

@RestApi(baseUrl: 'https://bpplaner.shop')
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

  @GET("/shops/waxingshops/")
  Future<ShopList> getWaxingList(
    @Query('page') int page,
    @Query('like') bool like,
    @Query('address') List<String>? address,
  );

  @GET("/shops/tanningshops/")
  Future<ShopList> getTanningList(
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
  Future<void> setLike(
    @Path('id') int id,
    @Body() LikeRequest like,
  );
}
