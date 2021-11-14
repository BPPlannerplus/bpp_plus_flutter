import 'package:bpp_riverpod/app/api/auth_client.dart';
import 'package:bpp_riverpod/app/api/concept_client.dart';
import 'package:bpp_riverpod/app/api/reservation_client.dart';
import 'package:bpp_riverpod/app/api/review_client.dart';
import 'package:bpp_riverpod/app/api/shop_client.dart';
import 'package:bpp_riverpod/app/dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authClientProvider = Provider<AuthClient>((ref) {
  // final dio = ref.watch(dioProvider);
  return AuthClient(Dio());
});

final shopClientProvider = Provider<ShopClient>((ref) {
  final dio = ref.watch(dioProvider);
  return ShopClient(dio);
});
final conceptClientProvider = Provider<ConceptClient>((ref) {
  final dio = ref.watch(dioProvider);
  return ConceptClient(dio);
});
final reservationClientProvider = Provider<ReservationClient>((ref) {
  final dio = ref.watch(dioProvider);
  return ReservationClient(dio);
});
final reviewClientProvider = Provider<ReviewClient>((ref) {
  final dio = ref.watch(dioProvider);
  return ReviewClient(dio);
});
