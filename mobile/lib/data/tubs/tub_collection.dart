import 'package:bathtub_models/data/tubs/tub.dart';

/// Note that the tubs are assumed to be non-overlapping at this stage.
class TubDefinitions {
  final Set<Tub> tubs;
  final int version;

  TubDefinitions({required this.tubs, required this.version});
}
