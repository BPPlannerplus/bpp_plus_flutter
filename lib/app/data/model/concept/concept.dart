class Concept {
  int id;
  String profile;
  IdNamePair shop;
  bool like;
  Concept({
    required this.id,
    required this.profile,
    required this.shop,
    required this.like,
  });
}

class IdNamePair {
  int id;
  String name;
  IdNamePair({
    required this.id,
    required this.name,
  });
}
