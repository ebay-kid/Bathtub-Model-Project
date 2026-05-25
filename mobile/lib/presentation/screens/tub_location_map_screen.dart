import 'dart:async';

import 'package:bathtub_models/data/gps/local_gps_provider.dart';
import 'package:bathtub_models/data/tubs/tub_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../data/tubs/tub.dart';

class TubLocationMapScreen extends StatefulWidget {
  const TubLocationMapScreen({super.key});

  @override
  State<TubLocationMapScreen> createState() => _TubLocationMapScreenState();
}

class _TubLocationMapScreenState extends State<TubLocationMapScreen> {
  final MapController mc = MapController();
  final LocalGpsProvider loc = LocalGpsProvider();

  Timer? _pollTimer;

  Tub? currentTub;

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
      currentTub = TubHandler().getCurrentTub(location, currentTub);
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
        PolygonLayer(
          polygons: [
            if (currentTub != null)
              Polygon(
                points: currentTub!.getDrawPoints(),
                color: const Color(0x6700FF00),
              ),
          ],
        ),
      ],
    );
  }
}
