import 'package:jwt_decoder/jwt_decoder.dart';

class Jwt {
  final int userId;
  final String userName;

  Jwt({
    required this.userId,
    required this.userName,
  });

  int getUserId(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    return decodedToken['user_id'];
  }

  String getUserName(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    return decodedToken['user_name'];
  }
}
