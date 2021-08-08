import 'package:flash_card/flashcard.dart';
import 'package:flash_card/flashcard_view.dart';
import 'package:flash_card/flutter.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Flashcards());
}

class Flashcards extends StatefulWidget {
  const Flashcards({Key? key}) : super(key: key);

  @override
  _FlashcardsState createState() => _FlashcardsState();
}

class _FlashcardsState extends State<Flashcards> {
  List _flashData = [
    Flash(front: "Which programming language flutter Uses?", back: "Dart"),
    Flash(front: "Is flutter good ?", back: "Flutter is awsome"),
    Flash(front: "what is flutter", back: FlutterData.flutter),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flashcards'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                height: 300,
                child: FlipCard(
                  front: FlashcardsView(text: _flashData[currentIndex].front),
                  back: FlashcardsView(text: _flashData[currentIndex].back),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: back,
                    child: Icon(CupertinoIcons.back),
                  ),
                  OutlinedButton(
                      onPressed: next, child: Icon(CupertinoIcons.forward))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  next() {
    setState(() {
      currentIndex =
          currentIndex == _flashData.length - 1 ? 0 : currentIndex + 1;
    });
  }

  back() {
    setState(() {
      currentIndex =
          currentIndex == 0 ? _flashData.length - 1 : currentIndex - 1;
    });
  }
}
