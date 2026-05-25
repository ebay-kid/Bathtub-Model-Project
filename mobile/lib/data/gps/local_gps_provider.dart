import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocalGpsProvider {
  bool _locationServiceInitialized = false;
  Position? _position;

  /// Poke the class. I'm not actually sure if this is necessary.
  static void poke() {
    inst._runLocInitIfNotRunYet();
  }

  void _runLocInitIfNotRunYet() async {
    if (!_locationServiceInitialized) {
      var res =
          await _initLocationService(); // todo: add error messaging if we're denied
      if (res) {
        Geolocator.getPositionStream().listen((Position? position) {
          if (position != null) {
            _position = position;
          }
          // print(position == null ? 'Unknown' : '${position.latitude.toString()}, ${position.longitude.toString()}');
        });
      }
    }
  }

  LatLng getLatestLatLon() {
    if (_position == null) {
      return const LatLng(0, 0);
    }
    return LatLng(_position!.latitude, _position!.longitude);
  }

  LocalGpsProvider._internal() {
    _runLocInitIfNotRunYet();
  }

  static final LocalGpsProvider inst = LocalGpsProvider._internal();
  factory LocalGpsProvider() => inst;

  /// Attempt to initialize location services.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<bool> _initLocationService() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    return (_locationServiceInitialized = true);
  }
}
