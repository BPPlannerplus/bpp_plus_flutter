// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'mypage_shop_data.g.dart';
part 'mypage_shop_data.freezed.dart';

@freezed
class MypageShopData with _$MypageShopData {
  factory MypageShopData({
    required int id,
    required String name,
    required String logo,
    @JsonKey(name: 'kakaourl') required String kakaoUrl,
    @JsonKey(name: 'shop_type') required int type,
  }) = _MypageShopData;

  factory MypageShopData.fromJson(Map<String, dynamic> json) =>
      _$MypageShopDataFromJson(json);
}
