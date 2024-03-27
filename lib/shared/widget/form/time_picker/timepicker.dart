import 'package:flutter/material.dart';

class QTimePicker extends StatefulWidget {
  const QTimePicker({
    required this.label,
    required this.onChanged,
    super.key,
    this.value,
    this.validator,
    this.hint,
    this.helper,
  });
  final String label;
  final TimeOfDay? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final Function(TimeOfDay?) onChanged;

  @override
  State<QTimePicker> createState() => _QTimePickerState();
}

class _QTimePickerState extends State<QTimePicker> {
  TimeOfDay? selectedValue;
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
    controller = TextEditingController(
      text: getInitialValue(),
    );
  }

  String getInitialValue() {
    if (widget.value != null) {
      final hh = widget.value?.hour.toString().padLeft(2, '0');
      final mm = widget.value?.minute.toString().padLeft(2, '0');
      return '$hh:$mm';
    }
    return '-';
  }

  String getFormattedValue() {
    if (selectedValue != null) {
      final hh = selectedValue?.hour.toString().padLeft(2, '0');
      final mm = selectedValue?.minute.toString().padLeft(2, '0');
      return '$hh:$mm';
    }
    return '-';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        final pickedTime = await showTimePicker(
          initialTime: widget.value ?? TimeOfDay.now(),
          context: context,
          builder: (context, child) {
            return MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: child ?? Container(),
            );
          },
        );
        print('pickedTime: $pickedTime');
        selectedValue = pickedTime;
        controller.text = getFormattedValue();
        setState(() {});

        widget.onChanged(selectedValue);
      },
      child: AbsorbPointer(
        child: Container(
          margin: const EdgeInsets.only(
            bottom: 12,
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
                Icons.timer,
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
