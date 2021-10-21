// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_data.g.dart';
part 'shop_data.freezed.dart';

@freezed
class ShopData with _$ShopData {
  factory ShopData({
    required int id,
    required String name,
    required String address,
    required bool like,
    @JsonKey(name: 'minprice') required int minPrice,
    required String profile,
  }) = _ShopData;

  factory ShopData.fromJson(Map<String, dynamic> json) =>
      _$ShopDataFromJson(json);
}
