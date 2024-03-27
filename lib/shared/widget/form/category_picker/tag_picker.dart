import 'package:flutter/material.dart';

class QTagPicker extends StatefulWidget {
  const QTagPicker({
    required this.items,
    required this.onChanged,
    super.key,
    this.itemBuilder,
    this.value,
    this.validator,
    this.label,
    this.hint,
    this.helper,
  });
  final List<Map<String, dynamic>> items;
  final String? label;
  final dynamic value;
  final String? Function(int? value)? validator;
  final String? hint;
  final String? helper;

  final Function(
    Map<String, dynamic> item,
    bool selected,
    Function action,
  )? itemBuilder;

  final Function(
    int index,
    String label,
    dynamic value,
    Map<String, dynamic> item,
  ) onChanged;

  @override
  State<QTagPicker> createState() => _QTagPickerState();
}

class _QTagPickerState extends State<QTagPicker> {
  List<Map<String, dynamic>> items = [];
  int selectedIndex = -1;

  updateIndex(newIndex) {
    selectedIndex = newIndex;
    setState(() {});
    final item = items[selectedIndex];
    final index = selectedIndex;
    final label = item['label'];
    final value = item['value'];
    widget.onChanged(index, label, value, item);
  }

  Widget getLabel() {
    if (widget.label == null) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.label}',
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).textTheme.bodySmall?.color,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
      ],
    );
  }

  @override
  void initState() {
    items = widget.items;
    if (widget.value != null) {
      selectedIndex = items.indexWhere((i) => i['value'] == widget.value);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: FormField(
        initialValue: false,
        validator: (value) =>
            widget.validator!(selectedIndex == -1 ? null : selectedIndex),
        builder: (FormFieldState<bool> field) {
          return Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(items.length, (index) {
              final selected = selectedIndex == index;
              final item = items[index];

              if (widget.itemBuilder != null) {
                return widget.itemBuilder!(item, selected, () {
                  updateIndex(index);
                });
              }

              return Container(
                child: ElevatedButton(
                  style: selected
                      ? null
                      : ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).disabledColor,
                          elevation: 0,
                        ),
                  onPressed: () => updateIndex(index),
                  child: Wrap(
                    children: [
                      Icon(
                        item['icon'],
                        size: 20,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(item['label']),
                    ],
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
