enum ShopType {
  stduio,
  beauty,
  waxing,
  tanning,
}

extension ShopTypeToString on ShopType {
  String get shopTypeToName {
    switch (this) {
      case ShopType.stduio:
        return '스튜디오';
      case ShopType.beauty:
        return '헤어메이크업';
      case ShopType.waxing:
        return '왁싱';
      case ShopType.tanning:
        return '태닝';
      default:
        return '';
    }
  }
}

enum ShopState {
  inquiry,
  confirmed,
  reviewed,
  unreviewd,
}

Map<int, String> shopTypeToName = {
  0: '스튜디오',
  1: '헤어메이크업',
  2: '왁싱',
  3: '태닝',
};

Map<String, String> shopAddrToKR = {
  'gangnam': '강남구',
  'gangdong': '강동구',
  'gwangjin': '광진구',
  'mapo': '마포구',
  'seocho': '서초구',
  'yangchun': '양천구',
};

const pageSize = 20;
