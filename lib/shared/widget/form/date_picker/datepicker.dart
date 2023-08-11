import 'package:hyper_ui/core.dart';
import 'package:flutter/material.dart';

class QDatePicker extends StatefulWidget {
  final String label;
  final DateTime? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final Function(DateTime) onChanged;

  const QDatePicker({
    Key? key,
    required this.label,
    this.value,
    this.validator,
    this.hint,
    this.helper,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<QDatePicker> createState() => _QDatePickerState();
}

class _QDatePickerState extends State<QDatePicker> {
  DateTime? selectedValue;
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
    controller = TextEditingController(
      text: getInitialValue(),
    );
  }

  getInitialValue() {
    if (widget.value != null) {
      return DateFormat("d MMM y").format(widget.value!);
    }
    return "-";
  }

  getFormattedValue() {
    if (selectedValue != null) {
      return DateFormat("d MMM y").format(selectedValue!);
    }
    return "-";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        selectedValue = pickedDate;
        controller.text = getFormattedValue();
        setState(() {});

        if (selectedValue == null) return;
        widget.onChanged(selectedValue!);
      },
      child: AbsorbPointer(
        child: Container(
          margin: const EdgeInsets.only(
            bottom: 12.0,
          ),
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (widget.validator != null) {
                return widget.validator!(selectedValue.toString());
              }
              return null;
            },
            readOnly: true,
            decoration: InputDecoration(
              labelText: widget.label,
              labelStyle: const TextStyle(
                color: Colors.blueGrey,
              ),
              suffixIcon: const Icon(
                Icons.date_range,
              ),
              helperText: widget.helper,
              hintText: widget.hint,
            ),
          ),
        ),
      ),
    );
  }
}
