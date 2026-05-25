import 'dart:math';

import 'package:bathtub_models/data/tubs/tub.dart';
import 'package:latlong2/latlong.dart';

typedef Rect = (LatLng tl, LatLng br);

class DummyTub extends Tub {
  final Rect r;
  DummyTub({required super.tubID, required this.r});

  @override
  Set<Tub> getNeighbors() {
    return {}; // return an empty set of neighbors.
  }

  @override
  bool isInTub(LatLng ll) {
    return min(r.$1.latitude, r.$2.latitude) < ll.latitude &&
        ll.latitude < max(r.$1.latitude, r.$2.latitude) &&
        min(r.$1.longitude, r.$2.longitude) < ll.longitude &&
        ll.longitude < max(r.$1.longitude, r.$2.longitude);
  }

  @override
  List<LatLng> getDrawPoints() {
    return [
      r.$1,
      LatLng(r.$1.latitude, r.$2.longitude), // tr
      r.$2,
      LatLng(r.$2.latitude, r.$1.longitude), // bl,
    ];
  }
}
