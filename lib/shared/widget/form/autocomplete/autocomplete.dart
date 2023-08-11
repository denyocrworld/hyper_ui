import 'package:hyper_ui/core.dart';
import 'package:flutter/material.dart';

class QAutoComplete extends StatefulWidget {
  final String label;
  final String? hint;
  final String? helper;
  final dynamic value;
  final List<Map<String, dynamic>> items;
  final String? Function(String? item)? validator;
  final Function(dynamic value, String? label) onChanged;
  final Function()? onFuture;

  const QAutoComplete({
    Key? key,
    required this.label,
    this.items = const [],
    this.onFuture,
    this.validator,
    this.hint,
    this.helper,
    this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<QAutoComplete> createState() => _QAutoCompleteState();
}

class _QAutoCompleteState extends State<QAutoComplete> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();

    if (widget.onFuture == null) {
      for (var item in widget.items) {
        items.add(Map.from(item));
      }
    } else {
      loadData();
    }
  }

  loadData() async {
    List<Map<String, dynamic>> serviceItems = await widget.onFuture!();
    for (var item in serviceItems) {
      items.add(item);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return Container();
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 12.0,
        ),
        child: FormField(
            initialValue: false,
            enabled: true,
            builder: (field) {
              return Autocomplete<Map>(
                fieldViewBuilder: (context, textEditingController, focusNode,
                    onFieldSubmitted) {
                  return Container(
                    child: TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      onFieldSubmitted: (text) => onFieldSubmitted(),
                      validator: widget.validator,
                      decoration: InputDecoration(
                        labelText: widget.label,
                        errorText: field.errorText,
                        suffixIcon: const Icon(Icons.search),
                        helperText: widget.helper,
                        hintText: widget.hint,
                      ),
                    ),
                  );
                },
                onSelected: (Map map) {
                  String? label = map["label"];
                  dynamic value = map["value"];
                  widget.onChanged(value, label);
                },
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<Map>.empty();
                  }
                  return items.where((Map option) {
                    return option["label"]
                        .toString()
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase());
                  });
                },
                displayStringForOption: (option) {
                  return option["label"];
                },
                optionsViewBuilder: (context, onSelected, options) => Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    color: Colors.transparent,
                    child: ClipRRect(
                      clipBehavior: Clip.none,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(12.0),
                      ),
                      child: Container(
                        width: constraints.biggest.width,
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Wrap(
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Theme.of(Get.currentContext)
                                    .scaffoldBackgroundColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.grey[300]!.withOpacity(0.4),
                                ),
                              ),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: options.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  bool selected =
                                      AutocompleteHighlightedOption.of(
                                              context) ==
                                          index;
                                  Map option = options.elementAt(index);

                                  return InkWell(
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () => onSelected(option),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: selected
                                            ? Theme.of(context).focusColor
                                            : null,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                            index == 0 ? 12 : 0,
                                          ),
                                          topRight: Radius.circular(
                                            index == 0 ? 12 : 0,
                                          ),
                                          bottomLeft: Radius.circular(
                                            index == options.length - 1
                                                ? 12
                                                : 0.0,
                                          ),
                                          bottomRight: Radius.circular(
                                            index == options.length - 1
                                                ? 12
                                                : 0.0,
                                          ),
                                        ),
                                      ),
                                      child: ListTile(
                                        leading: option["photo"] == null
                                            ? null
                                            : CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                  option["photo"],
                                                ),
                                              ),
                                        title: Text("${option["label"]}"),
                                        subtitle: option["info"] == null
                                            ? null
                                            : Text("${option["info"]}"),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      );
    });
  }
}
