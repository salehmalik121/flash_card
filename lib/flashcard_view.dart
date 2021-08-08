import 'package:flutter/material.dart';

class FlashcardsView extends StatelessWidget {
  final String? text;

  const FlashcardsView({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Center(
        child: Text(
          text.toString(),
        ),
      ),
    );
  }
}
