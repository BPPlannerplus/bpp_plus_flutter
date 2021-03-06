// ignore_for_file: invalid_annotation_target

import 'package:bpp_riverpod/app/model/mypage/mypage_shop_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mypage_data.g.dart';
part 'mypage_data.freezed.dart';

@freezed
class MypageData with _$MypageData {
  factory MypageData({
    required int id,
    required int state,
    required MypageShopData shop,
    @JsonKey(name: 'reserved_date') String? reservedData,
  }) = _MypageData;

  factory MypageData.fromJson(Map<String, dynamic> json) =>
      _$MypageDataFromJson(json);
}
