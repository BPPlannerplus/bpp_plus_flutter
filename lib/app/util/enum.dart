enum ShopType {
  stduio,
  beauty,
  waxing,
  tanning,
}
enum ShopState {
  inquiry,
  confirmed,
  expiration,
}

Map<int, String> shopTypeToName = {
  0: '스튜디오',
  1: '헤어메이크업',
  2: '왁싱',
  3: '태닝',
};

const pageSize = 20;
