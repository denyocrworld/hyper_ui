import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

showLoading({
  String? message,
}) async {
  await showDialog<void>(
    context: globalContext,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 110,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Align(
                  child: Wrap(
                    children: [
                      const SizedBox(
                        width: 12,
                        height: 12,
                        child: CircularProgressIndicator(),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        message ?? 'Loading...',
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

hideLoading() async {
  Get.back();
}
