import 'package:bpp_plus_flutter/app/data/model/concept/concept.dart';

class ConceptList {
  List<Concept> concepts;
  String? next;

  ConceptList({
    required this.concepts,
    this.next,
  });
}
