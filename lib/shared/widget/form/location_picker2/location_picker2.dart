import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:permission_handler/permission_handler.dart';

class QLocationPicker2 extends StatefulWidget {
  const QLocationPicker2({
    required this.onChanged,
    super.key,
    this.label,
    this.hint,
    this.helper,
    this.latitude,
    this.longitude,
    this.validator,
    this.enableEdit = true,
  });
  final String? label;
  final String? hint;
  final String? helper;
  final double? latitude;
  final double? longitude;
  final String? Function(String?)? validator;
  final Function(double latitude, double longitude, String address) onChanged;
  final bool enableEdit;

  @override
  _QLocationPicker2State createState() => _QLocationPicker2State();
}

class _QLocationPicker2State extends State<QLocationPicker2> {
  double? latitude;
  double? longitude;
  String? address;

  bool loading = true;

  @override
  void initState() {
    super.initState();
    latitude = widget.latitude;
    longitude = widget.longitude;
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
        var inputValue = '$latitude,$longitude';
        if (latitude == null) {
          inputValue = '';
        }
        if (widget.validator != null) {
          return widget.validator!(inputValue);
        }
        return null;
      },
      builder: (state) {
        return Container(
          margin: const EdgeInsets.only(
            bottom: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QButton(
                icon: Icons.location_on,
                label: latitude == null
                    ? 'Select location'.tr
                    : 'Change location'.tr,
                color: latitude == null ? disabledColor : primaryColor,
                onPressed: () async {
                  if (await Permission.location.request().isDenied) {
                    se('Location access is denied');
                    return;
                  }

                  await Get.to(
                    GoogleMapViewer(
                      latitude: latitude,
                      longitude: longitude,
                      onChanged: (ltd, lng, addr) {
                        latitude = ltd;
                        longitude = lng;
                        address = addr;

                        printo('latitude: $latitude');
                        printo('longitude: $longitude');
                        printo('address: $address');

                        widget.onChanged(latitude!, longitude!, address!);

                        setState(() {});
                      },
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 12,
              ),
              if (address != null) ...[
                Text(
                  'Generated address'.tr,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  address!,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
              if (state.errorText != null)
                Text(
                  state.errorText ?? '',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
