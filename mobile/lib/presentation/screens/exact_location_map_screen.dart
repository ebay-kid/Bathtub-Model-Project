import 'dart:async';

import 'package:bathtub_models/data/gps/local_gps_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ExactLocationMapScreen extends StatefulWidget {
  const ExactLocationMapScreen({super.key});

  @override
  State<ExactLocationMapScreen> createState() => _ExactLocationMapScreenState();
}

class _ExactLocationMapScreenState extends State<ExactLocationMapScreen> {
  final MapController mc = MapController();
  final LocalGpsProvider loc = LocalGpsProvider();

  Timer? _pollTimer;

  LatLng? currentLocation;

  @override
  void initState() {
    super.initState();

    _pollTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) async {
        await _updateLocation();
      },
    );

    _updateLocation();
  }

  Future<void> _updateLocation() async {
    final LatLng location = loc.getLatestLatLon();

    setState(() {
      currentLocation = location;
    });

    mc.move(location, mc.camera.zoom);
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mc,
      options: const MapOptions(
        initialCenter: LatLng(0, 0),
        initialZoom: 13,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.bathtub_models',
        ),
        MarkerLayer(
          markers: [
            if (currentLocation != null)
              Marker(
                point: currentLocation!,
                width: 40,
                height: 40,
                child: const Icon(
                  Icons.location_pin,
                  size: 40,
                  color: Colors.red,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
