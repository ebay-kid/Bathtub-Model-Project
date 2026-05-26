import 'package:latlong2/latlong.dart';

/// A descriptor of a Tub.
///
/// All tubs must be unique by tubID, i.e. two tubs with the same ID will be
/// treated as equal.
abstract class Tub {
  final String tubID;

  Tub({required this.tubID});

  /// Returns true when the provided latlong is in this tub, false otherwise.
  bool tubContainsLatLon(LatLng ll);

  /// Returns the set of neighbors of this Tub.
  /// A more precise list of neighbors will improve efficiency of Tub operations.
  ///
  /// We internally use this as an adjacency list. Since in theory we aren't
  /// jumping between non-adjacent tubs, when we leave a tub we can optimize
  /// our search algorithm for our new tub by first checking the neighbors
  /// of our previous tub.
  Set<Tub> getNeighbors();

  @override
  bool operator ==(Object other) {
    return other is Tub && other.tubID == tubID;
  }

  @override
  int get hashCode => tubID.hashCode;

  /// Used for rendering the Tub on the map. Whether this should be part
  /// of the general interface is up for debate, so a default "empty" impl is
  /// provided.
  ///
  /// Note that the provided draw points should be in clockwise order.
  /// https://pub.dev/documentation/flutter_map/latest/flutter_map/Polygon-class.html
  List<LatLng> getDrawPoints() {
    return [];
  }
}
