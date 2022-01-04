import 'package:bpp_riverpod/app/api/api_provider.dart';
import 'package:bpp_riverpod/app/api/reservation_client.dart';
import 'package:bpp_riverpod/app/api/review_client.dart';
import 'package:bpp_riverpod/app/api/shop_client.dart';
import 'package:bpp_riverpod/app/model/review/complain.dart';
import 'package:bpp_riverpod/app/model/review/review_list.dart';
import 'package:bpp_riverpod/app/model/shop/shop_concept.dart';
import 'package:bpp_riverpod/app/model/shop/shop_detail_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopDetailRepository = Provider<ShopDetailRepository>((ref) {
  final shopClient = ref.watch(shopClientProvider);
  final reviewClient = ref.watch(reviewClientProvider);
  final reservationClient = ref.watch(reservationClientProvider);

  return ShopDetailRepository(
    shopClient: shopClient,
    reviewClient: reviewClient,
    reservationClient: reservationClient,
  );
});

class ShopDetailRepository {
  ShopDetailRepository({
    required this.shopClient,
    required this.reviewClient,
    required this.reservationClient,
  });

  final ShopClient shopClient;
  final ReviewClient reviewClient;
  final ReservationClient reservationClient;

  Future<ShopConcepts> getShopConcepts(int id, int page) async {
    final shopConcepts = await shopClient.getShopConcepts(id, page);
    return shopConcepts;
  }

  Future<ShopDetailData> getShopDetail(int id) async {
    final shopDetail = await shopClient.getShopData(id);
    return shopDetail;
  }

  Future<ReviewList> getShopReviews(int id) async {
    final reviews = await reviewClient.getReviews(id);
    return reviews;
  }

  Future<dynamic> reportReview(int id, Complain complain) async {
    final response = await reviewClient.reportReview(id, complain);
    return response;
  }

  Future<dynamic> setLike() async {}

  Future<dynamic> shopReservation(int id) async {
    final response = await reservationClient.setShopReservation(id);
    return response;
  }
}
