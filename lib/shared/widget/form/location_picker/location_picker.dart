import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import 'location_picker_map_view.dart';
import 'map_viewer.dart';

class QLocationPicker extends StatefulWidget {
  final String id;
  final String? label;
  final String? hint;
  final String? helper;
  final double? latitude;
  final double? longitude;
  final String? Function(double? latitude, double? longitude)? validator;
  final Function(double latitude, double longitude) onChanged;
  final bool enableEdit;

  const QLocationPicker({
    Key? key,
    required this.id,
    this.label,
    this.hint,
    this.helper,
    this.latitude,
    this.longitude,
    this.validator,
    required this.onChanged,
    this.enableEdit = true,
  }) : super(key: key);

  @override
  _QLocationPickerState createState() => _QLocationPickerState();
}

class _QLocationPickerState extends State<QLocationPicker> {
  double? latitude;
  double? longitude;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    if (widget.latitude == null || widget.longitude == null) {
      getLocation();
    } else {
      latitude = widget.latitude;
      longitude = widget.longitude;
      loading = false;
    }
  }

  getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    latitude = position.latitude;
    longitude = position.longitude;
    loading = false;
    setState(() {});

    widget.onChanged(latitude!, longitude!);
  }

  bool isLocationPicked() {
    if (latitude != null && longitude != null) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return Text("Get location...");
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12.0,
      ),
      child: FormField(
        initialValue: false,
        validator: (value) {
          if (widget.validator != null) {
            return widget.validator!(latitude, longitude);
          }
          return null;
        },
        enabled: true,
        builder: (FormFieldState<bool> field) {
          return InputDecorator(
            decoration: InputDecoration(
              labelText: widget.label,
              errorText: field.errorText,
              border: InputBorder.none,
              helperText: widget.helper,
              hintText: widget.hint,
            ),
            child: Container(
              margin: const EdgeInsets.only(
                top: 8.0,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 120.0,
                    height: 120.0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      child: loading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.orange,
                              ),
                            )
                          : MapViewer(
                              latitude: latitude,
                              longitude: longitude,
                            ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 128,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Latitude:",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          Text(
                            "$latitude",
                            style: const TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          const Text(
                            "Longitude:",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          Text(
                            "$longitude",
                            style: const TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          if (!isLocationPicked())
                            ElevatedButton.icon(
                              icon: const Icon(Icons.location_on),
                              label: const Text("Select"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey,
                              ),
                              onPressed: () async {
                                if (!kIsWeb &&
                                    (Platform.isAndroid || Platform.isIOS)) {
                                  if (!await Permission.location
                                      .request()
                                      .isGranted) {
                                    return;
                                  }
                                  return;
                                }

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ExLocationPickerMapView(
                                      id: widget.id,
                                      latitude: latitude,
                                      longitude: longitude,
                                      enableEdit: widget.enableEdit,
                                      onChanged: widget.onChanged,
                                    ),
                                  ),
                                );

                                setState(() {});
                              },
                            ),
                          if (isLocationPicked())
                            Transform.scale(
                              scale: 0.6,
                              alignment: Alignment.topLeft,
                              child: ElevatedButton.icon(
                                icon: const Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  widget.enableEdit ? "Change" : "View",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ExLocationPickerMapView(
                                        id: widget.id,
                                        latitude: latitude,
                                        longitude: longitude,
                                        enableEdit: widget.enableEdit,
                                        onChanged: widget.onChanged,
                                      ),
                                    ),
                                  );

                                  loading = true;
                                  setState(() {});

                                  await Future.delayed(
                                      const Duration(milliseconds: 200));

                                  loading = false;
                                  setState(() {});
                                },
                              ),
                            ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
