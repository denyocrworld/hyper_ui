import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/shared/util/translation/language.dart';
import 'package:url_launcher/url_launcher.dart';

const String _CLOUDINARY_CLOUD_NAME = 'dotz74j1p';
const String _CLOUDINARY_API_KEY = '983354314759691';
const String _CLOUDINARY_UPLOAD_PRESET = 'yogjjkoh';

class QFilePicker extends StatefulWidget {
  const QFilePicker({
    required this.label,
    required this.onChanged,
    super.key,
    this.value,
    this.validator,
    this.hint,
    this.helper,
    this.obscure = false,
    this.extensions = const ['csv', 'pdf', 'txt'],
    this.enabled = true,
  });
  final String label;
  final String? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final bool obscure;
  final Function(String) onChanged;
  final List<String> extensions;
  final bool enabled;

  @override
  State<QFilePicker> createState() => _QFilePickerState();
}

class _QFilePickerState extends State<QFilePicker> {
  String? fileUrl;
  bool loading = false;
  late TextEditingController controller;
  @override
  void initState() {
    fileUrl = widget.value;
    controller = TextEditingController(
      text: widget.value ?? '-',
    );
    super.initState();
  }

  Future<String?> getFileMultiplePlatform() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: widget.extensions,
    );
    if (result == null) return null;
    return result.files.first.path;
  }

  Future<String> uploadToCloudinary(String filePath) async {
    final formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(
        File(filePath).readAsBytesSync(),
        filename: "upload.${filePath.split(".").last}",
      ),
      'upload_preset': _CLOUDINARY_UPLOAD_PRESET,
      'api_key': _CLOUDINARY_API_KEY,
    });

    final res = await Dio().post(
      'https://api.cloudinary.com/v1_1/$_CLOUDINARY_CLOUD_NAME/raw/upload',
      data: formData,
    );

    final String url = res.data['secure_url'];
    return url;
  }

  Future<void> browseFile() async {
    if (loading) return;
    String? filePath;

    filePath = await getFileMultiplePlatform();
    if (filePath == null) return;

    loading = true;
    setState(() {});

    fileUrl = await uploadToCloudinary(filePath);

    loading = false;
    setState(() {});

    if (fileUrl != null) {
      widget.onChanged(fileUrl!);
      controller.text = fileUrl!;
    }
    setState(() {});
  }

  viewFile() async {
    final url = fileUrl!;
    print(url);
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  String? get currentValue {
    return fileUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: FormField(
                  initialValue: false,
                  validator: (value) {
                    return widget.validator!(fileUrl);
                  },
                  builder: (FormFieldState<bool> field) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller,
                            obscureText: widget.obscure,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: widget.label,
                              labelStyle: const TextStyle(
                                color: Colors.blueGrey,
                              ),
                              helperText: widget.helper,
                              hintText: widget.hint,
                              errorText: field.errorText,
                            ),
                            onChanged: (value) {
                              widget.onChanged(value);
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        if (widget.enabled)
                          Container(
                            width: 50,
                            height: 46,
                            margin: const EdgeInsets.only(
                              right: 4,
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                                backgroundColor: Colors.grey[500],
                              ),
                              onPressed: browseFile,
                              child: const Icon(
                                Icons.file_upload,
                                size: 24,
                              ),
                            ),
                          ),
                        if (fileUrl != null)
                          Container(
                            width: 50,
                            height: 46,
                            margin: const EdgeInsets.only(
                              right: 4,
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                                backgroundColor: Colors.grey[500],
                              ),
                              onPressed: viewFile,
                              child: const Icon(
                                Icons.remove_red_eye,
                                size: 24,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          if (loading)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      8,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Uploading...'.tr,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
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
