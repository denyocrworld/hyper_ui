import 'package:hyper_ui/core.dart';
import 'package:flutter/material.dart';

showLoading({
  String? message,
}) async {
  await showDialog<void>(
    context: globalContext,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 110,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Wrap(
                    children: [
                      const SizedBox(
                        width: 12,
                        height: 12,
                        child: CircularProgressIndicator(),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        message ?? "Loading...",
                        style: const TextStyle(
                          fontSize: 10.0,
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
