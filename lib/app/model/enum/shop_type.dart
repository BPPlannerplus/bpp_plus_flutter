enum ShopType {
  studio,
  beautyshop,
  waxingshop,
  tanningshop,
}

extension ShopTypeToString on ShopType {
  String get shopTypeToName {
    switch (this) {
      case ShopType.studio:
        return '스튜디오';
      case ShopType.beautyshop:
        return '헤어메이크업';
      case ShopType.waxingshop:
        return '왁싱';
      case ShopType.tanningshop:
        return '태닝';
      default:
        return '';
    }
  }
}

String shopTypeToString(int index) {
  switch (index) {
    case 0:
      return '스튜디오';
    case 1:
      return '헤어메이크업';
    case 2:
      return '왁싱';
    case 3:
      return '태닝';
    default:
      return '';
  }
}
