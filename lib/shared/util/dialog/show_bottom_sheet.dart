import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

Future showSlideableBottomSheet() async {
  await showModalBottomSheet<void>(
    context: Get.currentContext,
    builder: (BuildContext context) {
      return const BottomSheetView();
    },
  );
}

class BottomSheetView extends StatefulWidget {
  const BottomSheetView({Key? key}) : super(key: key);

  @override
  State<BottomSheetView> createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<BottomSheetView> {
  bool visible = false;
  updateVisibility() {
    visible = !visible;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (e) {
        print(e.velocity.pixelsPerSecond.direction);
      },
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          children: [
            if (visible)
              const SizedBox(
                height: 100.0,
              ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Your order was placed!'),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Ok"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
