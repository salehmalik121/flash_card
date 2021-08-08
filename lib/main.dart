import 'package:flash_card/flashcard.dart';
import 'package:flash_card/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
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
  List _flashcards = [
    Flash(qs: "Which programming language Flutter uses?", ans: "Dart"),
    Flash(qs: "Is flutter good?", ans: "Flutter is awsome"),
    Flash(
        qs: "What is flutter?",
        ans:
            "Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.")
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    print(_flashcards.length);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                height: 300,
                child: FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    front: FlashCardView(text: _flashcards[currentIndex].qs),
                    back: FlashCardView(text: _flashcards[currentIndex].ans)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: decrement,
                    child: Icon(Icons.arrow_back_sharp),
                  ),
                  OutlinedButton(
                    onPressed: incriment,
                    child: Icon(Icons.arrow_forward_sharp),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  incriment() {
    setState(() {
      if (currentIndex == _flashcards.length - 1) {
        currentIndex = 0;
      } else {
        currentIndex++;
      }
    });
  }

  decrement() {
    setState(() {
      if (currentIndex == 0) {
        currentIndex = _flashcards.length - 1;
      } else {
        currentIndex--;
      }
    });
  }
}
