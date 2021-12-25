import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_list_dto.freezed.dart';

@freezed
class ShopListDto with _$ShopListDto {
  factory ShopListDto({
    required List<ShopData> shopData,
    required int nextPage,
    required bool hasNext,
  }) = _ShopListDto;
}
