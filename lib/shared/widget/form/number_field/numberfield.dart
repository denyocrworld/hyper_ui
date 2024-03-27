import 'package:flutter/material.dart';
import 'package:hyper_ui/shared/theme/theme_config.dart';
import 'package:intl/intl.dart';

class QNumberField extends StatefulWidget {
  const QNumberField({
    required this.label,
    required this.onChanged,
    super.key,
    this.value,
    this.validator,
    this.hint,
    this.helper,
    this.onSubmitted,
    this.pattern,
    this.locale = 'en_US',
  });
  final String label;
  final String? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;

  final String? pattern;
  final String? locale;

  @override
  State<QNumberField> createState() => _QNumberFieldState();
}

class _QNumberFieldState extends State<QNumberField> {
  String? value;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    value = widget.value?.replaceAll(RegExp('[^0-9.]'), '');
    print('value: $value');
    print('value: ${widget.value}');
    controller = TextEditingController();
    controller.text = formattedValue?.toString() ?? '';
  }

  String? get formattedValue {
    if (widget.pattern != null) {
      final currencyFormat = NumberFormat(widget.pattern, widget.locale);
      final pValue = num.tryParse(value.toString()) ?? 0;
      return currencyFormat.format(pValue);
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      constraints: BoxConstraints(
        minHeight: inputHeight,
      ),
      child: TextFormField(
        controller: controller,
        validator: widget.validator,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: widget.label,
          suffixIcon: const Icon(
            Icons.numbers,
          ),
          helperText: widget.helper,
          hintText: widget.hint,
        ),
        onChanged: (newValue) {
          final newValue = controller.text;
          print('newValue: $newValue');

          value = newValue.replaceAll(RegExp('[^0-9.]'), '');

          print('value: $value');
          controller.text = formattedValue ?? '';
          controller.selection =
              TextSelection.collapsed(offset: controller.text.length);

          widget.onChanged(newValue.replaceAll(RegExp(r'\D'), ''));
        },
        onFieldSubmitted: (newValue) {
          final newValue = controller.text;
          print('newValue: $newValue');

          value = newValue.replaceAll(RegExp('[^0-9.]'), '');

          print('value: $value');
          controller.text = formattedValue ?? '';
          controller.selection =
              TextSelection.collapsed(offset: controller.text.length);

          if (widget.onSubmitted != null) {
            widget.onSubmitted!(newValue.replaceAll(RegExp(r'\D'), ''));
          }
        },
      ),
    );
  }
}
