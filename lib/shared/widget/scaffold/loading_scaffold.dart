import 'package:flutter/material.dart';

class LoadingScaffold extends StatelessWidget {
  final String? message;
  LoadingScaffold({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            const SizedBox(
              height: 12.0,
            ),
            if (message != null)
              Text(
                "$message",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
