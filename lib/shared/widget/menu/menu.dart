import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class QGridMenu extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const QGridMenu({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.0,
            crossAxisCount: 4,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
          ),
          itemCount: items.length,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            var item = items[index];
            return InkWell(
              onTap: () {
                Get.to(item["view"]);
              },
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: FittedBox(
                        child: Icon(
                          item["icon"],
                          color: item["color"],
                        ),
                      ),
                    ),
                    Text(
                      item["label"],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: item["color"],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
