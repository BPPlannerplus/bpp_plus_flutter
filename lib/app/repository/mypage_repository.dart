import 'package:bpp_riverpod/app/model/mypage/mypage_data.dart';
import 'package:bpp_riverpod/app/model/mypage/mypage_response.dart';
import 'package:bpp_riverpod/app/model/mypage/mypage_shop_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mypageRepsitory =
    Provider<MypageRepository>((ref) => FakeMypageRepository());

abstract class MypageRepository {
  // 샵 문의 중 조회
  Future<MypageResponse> getShopInquiring();

  // 샵 확정/만료 조회
  Future<MypageResponse> getShopReservation();

  // 확정날짜 받기
  Future<void> setReservationDate();

  // 문의중 삭제
  Future<void> deleteInquiring();

  // 리뷰  작성
  Future<void> createReview();

  // 리뷰 수정
  Future<void> updateReview();

  // 리뷰 삭제
  Future<void> deleteReview();
}

class FakeMypageRepository implements MypageRepository {
  @override
  Future<MypageResponse> getShopInquiring() async {
    await Future.delayed(const Duration(seconds: 1));
    return MypageResponse(
      remainingDays: 16,
      list: List.generate(
        10,
        (index) => MypageData(
          id: index,
          state: 0,
          shop: MypageShopData(
            id: index,
            name: 'Shop 1',
            logo:
                'https://www.loud.kr/upload/ordersub/b_file1/thumimg2/order_sub_2322404_1_191116000058.jpg',
            kakaoUrl: 'https://pf.kakao.com/_xgCxjfj',
            type: index % 4,
          ),
          reservedData: '2021.12.31',
        ),
      ),
    );
  }

  @override
  Future<MypageResponse> getShopReservation() async {
    await Future.delayed(const Duration(seconds: 1));
    return MypageResponse(
      remainingDays: 16,
      list: List.generate(
        10,
        (index) => MypageData(
          id: index,
          state: index % 2 + 1,
          shop: MypageShopData(
            id: index,
            name: 'Shop 1',
            logo:
                'https://www.loud.kr/upload/ordersub/b_file1/thumimg2/order_sub_2322404_1_191116000058.jpg',
            kakaoUrl: 'https://pf.kakao.com/_xgCxjfj',
            type: index % 4,
          ),
          reservedData: '2021.12.31',
        ),
      ),
    );
  }

  @override
  Future<void> createReview() {
    // TODO: implement createReview
    throw UnimplementedError();
  }

  @override
  Future<void> deleteInquiring() {
    // TODO: implement deleteInquiring
    throw UnimplementedError();
  }

  @override
  Future<void> deleteReview() {
    // TODO: implement deleteReview
    throw UnimplementedError();
  }

  @override
  Future<void> setReservationDate() {
    // TODO: implement setReservationDate
    throw UnimplementedError();
  }

  @override
  Future<void> updateReview() {
    // TODO: implement updateReview
    throw UnimplementedError();
  }
}
