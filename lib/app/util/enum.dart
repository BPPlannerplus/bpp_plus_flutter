enum ShopType {
  stduio,
  beauty,
  waxing,
  tanning,
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
};

const pageSize = 20;
