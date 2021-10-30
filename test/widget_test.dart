import 'package:bpp_riverpod/app/model/shop_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

Future<ShopData> fetchPost(Dio dio) async {
  final response =
      await dio.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    return ShopData.fromJson(response.data);
  } else {
    throw Exception('Failed to load post');
  }
}

class MockClient extends Mock implements Dio {}

// main() {
//   group('fetchPost', () {
//     test('returns a Post if the http call completes successfully', () async {
//       final client = MockClient();

//       // 제공된 http.Client를 호출했을 때, 성공적인 응답을 반환하기 위해 
//       // Mockito를 사용합니다.
//       when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
//           .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

//       expect(await fetchPost(client), const TypeMatcher<Post>());
//     });

//     test('throws an exception if the http call completes with an error', () {
//       final client = MockClient();

//       // 제공된 http.Client를 호출했을 때, 실패 응답을 반환하기 위해 
//       // Mockito를 사용합니다.
//       when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
//           .thenAnswer((_) async => http.Response('Not Found', 404));

//       expect(fetchPost(client), throwsException);
//     });
//   });
// }
