import 'package:bathtub_models/data/tubs/tub.dart';
import 'package:bathtub_models/data/tubs/tub_collection.dart';
import 'package:latlong2/latlong.dart';

import 'impl/dummy_tub.dart';

/// Handles the tubs.
class TubHandler {
  TubDefinitions tubs;

  TubHandler._internal({required this.tubs});
  static final TubHandler inst = TubHandler._internal(
      tubs: TubDefinitions(tubs: {
    DummyTub(tubID: 'dummytub1', r: (
      const LatLng(33.84556, -117.830634),
      const LatLng(33.794541, -117.720127)
    )),
    DummyTub(tubID: 'dummytub2', r: (
      const LatLng(33.667557, -117.866814),
      const LatLng(33.619689, -117.794963)
    )),
  }, version: 1));
  factory TubHandler() => inst;
  // todo: constructors/generators that convert incoming tub information into TubDefinitions

  /// Determines the current tub, given the current location and an optional reference point of a previous tub.
  /// The previous tub's neighbors will be checked before the full set of tubs is checked as an optimization.
  ///
  /// Note that only the first matching result will be accepted.
  Tub? getCurrentTub(LatLng currentLoc, [Tub? prev]) {
    if (prev != null) {
      if (prev.tubContainsLatLon(currentLoc)) {
        return prev;
      }

      for (Tub t in prev.getNeighbors()) {
        if (t.tubContainsLatLon(currentLoc)) {
          return t;
        }
      }
    }

    for (Tub t in tubs.tubs) {
      if (t.tubContainsLatLon(currentLoc)) {
        return t;
      }
    }

    return null;
  }
}
