import 'package:bpp_riverpod/app/model/auth/token_data.dart';
import 'package:bpp_riverpod/app/model/auth/user_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 초기값
final userInfoProvider = StateProvider<UserInfo>(
    (ref) => UserInfo(uid: -1, userName: 'User', pk: -1));

final tokenDataProvider =
    StateProvider<TokenData>((ref) => TokenData(accessToken: ''));
