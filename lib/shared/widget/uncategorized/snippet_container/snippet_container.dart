import 'package:flutter/material.dart';

class SnippetContainer extends StatelessWidget {
  const SnippetContainer(this.snippet, {super.key});
  final String snippet;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 12,
          ),
          child: Row(
            children: [
              Card(
                color: Colors.purple,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  child: Text(
                    snippet,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
