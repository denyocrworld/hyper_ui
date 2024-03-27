import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hyper_ui/core.dart';

class GoogleMapViewer extends StatefulWidget {
  const GoogleMapViewer({
    required this.onChanged,
    super.key,
    this.latitude,
    this.longitude,
  });
  final double? latitude;
  final double? longitude;
  final Function(
    double latitude,
    double longitude,
    String address,
  ) onChanged;

  @override
  State<GoogleMapViewer> createState() => _GoogleMapViewerState();
}

class _GoogleMapViewerState extends State<GoogleMapViewer> {
  late GoogleMapController controller;
  LatLng? _center;

  @override
  void initState() {
    super.initState();
    if (widget.latitude != null) {
      _center = LatLng(
        widget.latitude!,
        widget.longitude!,
      );
    } else {
      getCurrentLocation();
    }
  }

  Future<void> getCurrentLocation() async {
    _center = null;
    setState(() {});

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      _center = LatLng(position.latitude, position.longitude);
    });
  }

  Future<List<String>> _fetchPlaces(String input) async {
    const baseUrl =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    final url = '$baseUrl?input=$input&key=${AppConfig.googleMapApiKey}';

    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        final places = <String>[];
        for (final prediction in response.data['predictions']) {
          places.add(prediction['description']);
        }
        return places;
      } else {
        throw Exception('Failed to fetch places');
      }
    } catch (error) {
      throw Exception('Failed to fetch places: $error');
    }
  }

  Future<LatLng> getPlaceLatLng(String place) async {
    const baseUrl =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json';
    final url =
        '$baseUrl?input=$place&inputtype=textquery&fields=geometry&key=${AppConfig.googleMapApiKey}';

    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        final double lat =
            response.data['candidates'][0]['geometry']['location']['lat'];
        final double lng =
            response.data['candidates'][0]['geometry']['location']['lng'];
        return LatLng(lat, lng);
      } else {
        throw Exception('Failed to get place coordinates');
      }
    } catch (error) {
      throw Exception('Failed to get place coordinates: $error');
    }
  }

  String? address;
  Future<void> getAddress(double latitude, double longitude) async {
    const baseUrl = 'https://maps.googleapis.com/maps/api/geocode/json';
    final url =
        '$baseUrl?latlng=$latitude,$longitude&key=${AppConfig.googleMapApiKey}';

    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        setState(() {
          address = response.data['results'][0]['formatted_address'];
        });
      } else {
        setState(() {
          address = 'Failed to get address';
        });
      }
    } catch (error) {
      print(error);
      setState(() {
        address = 'Failed to get address';
      });
    }
  }

  List<String> places = [];
  String search = '';
  @override
  Widget build(BuildContext context) {
    if (_center == null) return LoadingScaffold();

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _center!,
                  zoom: 19,
                ),
                onMapCreated: (GoogleMapController c) {
                  controller = c;
                },
                onCameraMove: (position) {
                  _center = position.target;
                },
              ),
              const Center(
                child: Icon(
                  Icons.location_on,
                  size: 48,
                  color: Colors.red,
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.arrow_back,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextFormField(
                            key: Key('search_$search'),
                            initialValue: search,
                            decoration: const InputDecoration(
                              hintText: 'Search for a location',
                            ),
                            onFieldSubmitted: (value) async {
                              places = await _fetchPlaces(value);
                              printr(places.toString());
                              search = value;
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (places.isNotEmpty)
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: ListView.builder(
                          itemCount: places.length,
                          physics: const ScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            final item = places[index];
                            return InkWell(
                              onTap: () async {
                                showLoading();
                                final pos = await getPlaceLatLng(item);
                                _center = LatLng(pos.latitude, pos.longitude);
                                places = [];
                                search = '';
                                setState(() {});
                                controller.animateCamera(
                                  CameraUpdate.newLatLngZoom(pos, 15),
                                );
                                hideLoading();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: QActionButton(
        label: 'Select location'.tr,
        onPressed: () async {
          showLoading();
          await getAddress(_center!.latitude, _center!.longitude);
          widget.onChanged(
            _center!.latitude,
            _center!.longitude,
            address!,
          );
          printr('Address: $address');
          hideLoading();
          Navigator.pop(context);
        },
      ),
    );
  }
}
