enum ShopState {
  inquiry,
  confirmed,
  reviewed,
  unreviewd,
}

Map<String, String> shopAddrToKR = {
  'gangnam': '강남구',
  'gangdong': '강동구',
  'gwangjin': '광진구',
  'mapo': '마포구',
  'seocho': '서초구',
  'yangchun': '양천구',
};

const pageSize = 20;
