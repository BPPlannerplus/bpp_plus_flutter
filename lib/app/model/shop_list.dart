import 'package:bpp_riverpod/app/model/shop_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_list.freezed.dart';
part 'shop_list.g.dart';

@freezed
class ShopList with _$ShopList {
  factory ShopList({
    required List<ShopData> shopDatas,
    String? next,
  }) = _ShopList;

  factory ShopList.fromJson(Map<String, dynamic> json) =>
      _$ShopListFromJson(json);
}
