import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QNumberField extends StatefulWidget {
  final String label;
  final String? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;

  final String? pattern;
  final String? locale;

  const QNumberField({
    Key? key,
    required this.label,
    this.value,
    this.validator,
    this.hint,
    this.helper,
    required this.onChanged,
    this.onSubmitted,
    this.pattern,
    this.locale = "en_US",
  }) : super(key: key);

  @override
  State<QNumberField> createState() => _QNumberFieldState();
}

class _QNumberFieldState extends State<QNumberField> {
  String? value;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    value = widget.value?.replaceAll(RegExp(r'[^0-9.]'), '');
    print("value: $value");
    print("value: ${widget.value}");
    controller = TextEditingController();
    controller.text = formattedValue?.toString() ?? "";
  }

  String? get formattedValue {
    if (widget.pattern != null) {
      final currencyFormat = NumberFormat(widget.pattern, widget.locale);
      var pValue = num.tryParse(value.toString()) ?? 0;
      return currencyFormat.format(pValue);
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12.0,
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
          var newValue = controller.text;
          print("newValue: $newValue");

          value = newValue.replaceAll(RegExp(r'[^0-9.]'), '');

          print("value: $value");
          controller.text = formattedValue ?? "";
          controller.selection =
              TextSelection.collapsed(offset: controller.text.length);

          widget.onChanged(newValue.replaceAll(RegExp(r'\D'), ''));
        },
        onFieldSubmitted: (newValue) {
          var newValue = controller.text;
          print("newValue: $newValue");

          value = newValue.replaceAll(RegExp(r'[^0-9.]'), '');

          print("value: $value");
          controller.text = formattedValue ?? "";
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
