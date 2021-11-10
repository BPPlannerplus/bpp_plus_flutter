import 'package:bpp_riverpod/app/model/shop/shop_data.dart';
import 'package:bpp_riverpod/app/model/shop/shop_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopRepositroyProvider =
    Provider<ShopRepository>((ref) => StudioRepository());

final beautyRepositroyProvider =
    Provider<ShopRepository>((ref) => BeautyRepository());

final tanningRepositroyProvider =
    Provider<ShopRepository>((ref) => TanningRepository());

final waxingRepositroyProvider =
    Provider<ShopRepository>((ref) => WaxingRepository());

abstract class ShopRepository {
  // 샵 조회
  Future<ShopList> getShopList();

  // 좋아요
  Future<void> setLike(int id);
}

class StudioRepository implements ShopRepository {
  @override
  Future<ShopList> getShopList() async {
    await Future.delayed(const Duration(seconds: 1));
    return ShopList(
      shopDatas: List.generate(
        40,
        (index) => ShopData(
          id: index,
          name: 'StudioShop $index',
          address: '서울시 관악구',
          like: false,
          minPrice: 200000,
          profile:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSWX2EtpNdJxN2rTqCYLjdfjJA2TCZSem-jw&usqp=CAU',
        ),
      ),
      next: 'true',
    );
  }

  @override
  Future<void> setLike(int id) {
    throw UnimplementedError();
  }
}

class BeautyRepository implements ShopRepository {
  @override
  Future<ShopList> getShopList() async {
    await Future.delayed(const Duration(seconds: 1));
    return ShopList(
      shopDatas: List.generate(
        40,
        (index) => ShopData(
          id: index,
          name: 'Beautyshop $index',
          address: '서울시 관악구',
          like: false,
          minPrice: 300000,
          profile:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQkgt7DDEnw1KJd_DfIaMYFPCEJT1q4iAAmw&usqp=CAU',
        ),
      ).toList(),
    );
  }

  @override
  Future<void> setLike(int id) {
    // TODO: implement setLike
    throw UnimplementedError();
  }
}

class WaxingRepository implements ShopRepository {
  @override
  Future<ShopList> getShopList() async {
    await Future.delayed(const Duration(seconds: 1));
    return ShopList(
      shopDatas: List.generate(
        40,
        (index) => ShopData(
          id: index,
          name: 'WaxingShop $index',
          address: '서울시 관악구',
          like: false,
          minPrice: 50000,
          profile:
              'https://mblogthumb-phinf.pstatic.net/MjAyMDEwMDNfMTM2/MDAxNjAxNzEwODIyNDA4.mwf07nNjhNGpLnEkdj2s8NOjGiEoSdtWudZ8J1H2aFcg.-SyUA0hcggrQ7EsoB9jnHcbgTtM4q5hDvUSsTzm6APMg.JPEG.enway85/%EC%9D%B8%EC%8A%A4%ED%83%80%EC%9A%A9_(5).jpg?type=w800',
        ),
      ).toList(),
    );
  }

  @override
  Future<void> setLike(int id) {
    // TODO: implement setLike
    throw UnimplementedError();
  }
}

class TanningRepository implements ShopRepository {
  @override
  Future<ShopList> getShopList() async {
    await Future.delayed(const Duration(seconds: 1));
    return ShopList(
      shopDatas: List.generate(
        40,
        (index) => ShopData(
          id: index,
          name: 'TanningShop $index',
          address: '서울시 관악구',
          like: false,
          minPrice: 150000,
          profile: 'https://i.ytimg.com/vi/3odYULFS_28/maxresdefault.jpg',
        ),
      ).toList(),
    );
  }

  @override
  Future<void> setLike(int id) {
    // TODO: implement setLike
    throw UnimplementedError();
  }
}
