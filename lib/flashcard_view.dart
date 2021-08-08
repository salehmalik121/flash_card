import 'package:flutter/material.dart';

class FlashCardView extends StatelessWidget {
  final String text;

  const FlashCardView({Key? key, required this.text}) : super(key: key);
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
