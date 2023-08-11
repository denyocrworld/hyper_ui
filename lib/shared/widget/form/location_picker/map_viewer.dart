import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapViewer extends StatefulWidget {
  final double? latitude;
  final double? longitude;
  final Function(MapPosition, bool)? onPositionChanged;
  final MapController? controller;
  const MapViewer({
    Key? key,
    this.onPositionChanged,
    this.latitude,
    this.longitude,
    this.controller,
  }) : super(key: key);

  @override
  _MapViewerState createState() => _MapViewerState();
}

class _MapViewerState extends State<MapViewer> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    latitude = widget.latitude ?? -6.307332470724814;
    longitude = widget.longitude ?? 106.82061421166996;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: widget.controller,
          options: MapOptions(
            center: LatLng(latitude, longitude),
            zoom: 13.0,
            onPositionChanged: (pos, _) {
              if (widget.onPositionChanged != null) {
                widget.onPositionChanged!(pos, _);
              }
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Image.network(
              "https://i.ibb.co/LzvYfTb/684908.png",
              height: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}

class TileLayerOptions {}
