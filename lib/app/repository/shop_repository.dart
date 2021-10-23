import 'package:bpp_riverpod/app/model/shop_detail_data.dart';

abstract class ShopRepository {
  Future<ShopDetailData> getShopDetailData(int shopId);
}

class FakeShopRepositroy implements ShopRepository {
  @override
  Future<ShopDetailData> getShopDetailData(int shopId) async {
    await Future.delayed(const Duration(seconds: 1));
    return ShopDetailData(
      id: 1,
      name: 'Shop',
      logo:
          'https://png.pngtree.com/png-clipart/20200727/original/pngtree-photography-studio-logo-template-png-image_5392695.jpg',
      like: false,
      kakaoUrl: 'kakaoUrl',
      address: '서울특별시 관악구 봉천동~',
      profiles: [
        'https://modo-phinf.pstatic.net/20210107_257/1610007835482y4K17_JPEG/mosafm00Fx.jpeg?type=f540_540',
        'https://cphoto.asiae.co.kr/listimglink/6/2021032213224143007_1616386962.jpg',
        'http://img.marieclairekorea.com/2020/10/mck_5f914e9354384-562x781.png',
      ],
      mapImg:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVxXilxiRLh_dciqE35zNWPAidDcwYJi9yDA&usqp=CAU',
      minPrice: 200000,
      priceImg:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlCgKpOZmfvVT4dC1T5AmuwzKgqniVOXPN0A&usqp=CAU',
      partnershipList: List.generate(
        10,
        (index) => PartnershipData(
          id: index,
          name: '제휴업체 $index',
          profile:
              'https://cdn.imweb.me/upload/S20200731435c95ee6d424/24456b4049369.jpg',
        ),
      ),
    );
  }
}
