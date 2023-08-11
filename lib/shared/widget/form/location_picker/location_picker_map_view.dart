import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import 'map_viewer.dart';

class ExLocationPickerMapView extends StatefulWidget {
  final String id;

  final double? latitude;
  final double? longitude;
  final bool enableEdit;
  final Function(double latitude, double longitude) onChanged;
  const ExLocationPickerMapView({
    Key? key,
    required this.id,
    required this.enableEdit,
    this.latitude,
    this.longitude,
    required this.onChanged,
  }) : super(key: key);

  @override
  _ExLocationPickerMapViewState createState() =>
      _ExLocationPickerMapViewState();
}

class _ExLocationPickerMapViewState extends State<ExLocationPickerMapView> {
  @override
  Widget build(BuildContext context) {
    return LocationPickerMap(
      id: widget.id,
      latitude: widget.latitude,
      longitude: widget.longitude,
      onChanged: widget.onChanged,
    );
  }
}

class LocationPickerMap extends StatefulWidget {
  final String id;
  final double? latitude;
  final double? longitude;
  final double zoom;
  final bool enableMyLocationFeature;
  final bool enableEdit;
  final Function(double latitude, double longitude) onChanged;

  const LocationPickerMap({
    Key? key,
    required this.id,
    this.enableEdit = true,
    this.latitude,
    this.longitude,
    this.zoom = 16,
    this.enableMyLocationFeature = true,
    required this.onChanged,
  }) : super(key: key);

  @override
  LocationPickerMapState createState() => LocationPickerMapState();
}

class LocationPickerMapState extends State<LocationPickerMap> {
  bool loading = true;
  late double currentLatitude;
  late double currentLongitude;
  MapController mapController = MapController();

  initData() async {
    if (widget.latitude != null && widget.longitude != null) {
      currentLatitude = widget.latitude ?? currentLatitude;
      currentLongitude = widget.longitude ?? currentLongitude;
    } else {
      await getCurrentLocation();

      setState(() {
        loading = false;
      });
    }

    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  getCurrentLocation() async {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) return;

    var currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    currentLatitude = currentLocation.latitude;
    currentLongitude = currentLocation.longitude;
  }

  @override
  void initState() {
    super.initState();
    currentLatitude = widget.latitude ?? currentLatitude;
    currentLongitude = widget.longitude ?? currentLongitude;
    searchController = TextEditingController();
    initData();
  }

  bool updatePosition = false;

  List nominatimSearchResults = [];
  bool nominatimSearchLoading = false;
  void nominatimSearch(search) async {
    if (search.toString().isEmpty) return;

    setState(() {
      nominatimSearchLoading = true;
    });

    try {
      nominatimSearchResults.clear();
      var apiResponse = await Dio().get(
        "https://nominatim.openstreetmap.org/search/$search?format=json&limit=10",
      );

      nominatimSearchResults.addAll(apiResponse.data);
      setState(() {});
    } catch (_) {}

    setState(() {
      nominatimSearchLoading = false;
    });
  }

  bool typing = true;
  int tryCode = 0;
  late TextEditingController searchController;
  GlobalKey googleMapContainerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (loading) return const Scaffold();
    return Scaffold(
      body: Stack(
        children: [
          if (loading)
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: 50.0,
                child: const Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        child: Text("Updating Location..."),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (!loading)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(8.0),
                      width: MediaQuery.of(context).size.width,
                      height: 54.0,
                      child: Row(
                        children: [
                          InkWell(
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: TextField(
                              enabled: loading ? false : true,
                              controller: searchController,
                              decoration: const InputDecoration.collapsed(
                                hintText: "Search",
                              ),
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey[900],
                              ),
                              onChanged: (text) {
                                tryCode += 1;
                                var currentTryCode = tryCode;

                                Future.delayed(
                                  const Duration(milliseconds: 700),
                                  () {
                                    if (tryCode == currentTryCode) {
                                      nominatimSearch(text);
                                    } else {
                                      return;
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          InkWell(
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              searchController.text = "";
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: const Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      key: googleMapContainerKey,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: MapViewer(
                              latitude: currentLatitude,
                              longitude: currentLongitude,
                              controller: mapController,
                              onPositionChanged: (pos, _) {
                                log("${pos.center!.latitude},${pos.center!.longitude}");
                                currentLatitude = pos.center!.latitude;
                                currentLongitude = pos.center!.longitude;
                                setState(() {});
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 50.0),
                              child: Image.network(
                                "https://i.ibb.co/LzvYfTb/684908.png",
                                height: 50.0,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10.0,
                            child: Text("$currentLatitude,$currentLongitude"),
                          ),
                          if (widget.enableEdit == true)
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                color: Colors.transparent,
                                height: 58,
                                constraints:
                                    const BoxConstraints(maxWidth: 360.0),
                                margin: const EdgeInsets.only(
                                  bottom: 20.0,
                                ),
                                padding: const EdgeInsets.all(6.0),
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    "Select location",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                  ),
                                  onPressed: () async {
                                    debugPrint("currentLatitude : ");
                                    debugPrint("currentLongitude : ");

                                    Navigator.pop(context);

                                    widget.onChanged(
                                        currentLatitude, currentLongitude);
                                  },
                                ),
                              ),
                            ),
                          Positioned(
                            top: 50.0,
                            right: 10,
                            child: InkWell(
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                bool serviceEnabled =
                                    await Geolocator.isLocationServiceEnabled();
                                if (!serviceEnabled) {
                                  return Future.error(
                                      'Location services are disabled.');
                                }

                                LocationPermission permission =
                                    await Geolocator.checkPermission();
                                if (permission == LocationPermission.denied) {
                                  permission =
                                      await Geolocator.requestPermission();
                                  if (permission == LocationPermission.denied) {
                                    return Future.error(
                                        'Location permissions are denied');
                                  }
                                }

                                if (permission ==
                                    LocationPermission.deniedForever) {
                                  return Future.error(
                                      'Location permissions are permanently denied, we cannot request permissions.');
                                }

                                Position position =
                                    await Geolocator.getCurrentPosition();
                                mapController.move(
                                  LatLng(
                                    position.latitude,
                                    position.longitude,
                                  ),
                                  widget.zoom,
                                );
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.gps_fixed,
                                  size: 32.0,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (nominatimSearchLoading || nominatimSearchResults.isNotEmpty)
            Positioned(
              left: 0,
              right: 0,
              top: 50,
              bottom: 0,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      children: [
                        if (nominatimSearchLoading)
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                              top: 8.0,
                              bottom: 8.0,
                            ),
                            child: Text(
                              "Searching...",
                              style: TextStyle(
                                color: Colors.grey[900],
                              ),
                            ),
                          ),
                        if (nominatimSearchResults.isNotEmpty)
                          Container(
                            color: Colors.white,
                            height: 500.0,
                            child: Wrap(
                                children: List.generate(
                                    nominatimSearchResults.length, (index) {
                              var item = nominatimSearchResults[index];
                              var displayName = item["display_name"];
                              var lat = double.parse(item["lat"].toString());
                              var lng = double.parse(item["lon"].toString());

                              return InkWell(
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  updatePosition = true;
                                  currentLatitude = lat;
                                  currentLongitude = lng;

                                  nominatimSearchResults = [];

                                  searchController.text = item["display_name"];

                                  mapController.move(
                                      LatLng(
                                        currentLatitude,
                                        currentLongitude,
                                      ),
                                      13.0);

                                  setState(() {
                                    nominatimSearchResults = [];
                                  });
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(
                                    left: 16.0,
                                    right: 16.0,
                                    top: 8.0,
                                    bottom: 8.0,
                                  ),
                                  child: Text(
                                    displayName,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[900],
                                    ),
                                  ),
                                ),
                              );
                            })),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
