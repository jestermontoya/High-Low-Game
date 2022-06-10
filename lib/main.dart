import 'dart:math';
import 'package:finalproject/logic.dart';
import 'package:finalproject/menu.dart';
import 'package:finalproject/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: mainMenu(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HiLowGame extends StatefulWidget {
  const HiLowGame({super.key});

  @override
  State<HiLowGame> createState() => _HiLowGameState();
}

class _HiLowGameState extends State<HiLowGame> {
  void GameLogic() {
    if (ans == ">=") {
      if (cardsValue[gCard]! >= cardsValue[updateCard[0]]!) {
        correctShow();
      } else {
        gameOverShow();
      }
    } else if (ans == "<") {
      if (cardsValue[gCard]! < cardsValue[updateCard[0]]!) {
        correctShow();
      } else {
        gameOverShow();
      }
    }
  }

  void guessIsCorrect() {
    score++;
    ans = "";
    updateCard.insert(0, gCard);
    gNumberCard = Random().nextInt(52) + 1;
    gCard = "assets/img/$gNumberCard.png";
  }

  void gameReset() {
    score = 0;
    ans = "";
    card1 = Random().nextInt(52) + 1;
    updateCard = [
      "assets/img/$card1.png",
      cardBack, cardBack, cardBack, cardBack
    ];
  }

  void gameOverShow() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Game Over"),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pop(false);
                      gameReset();
                      isBack = true;
                    });
                  },
                  child: Text("Play Again", style: TextStyle(fontSize: 18)),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    SystemNavigator.pop();
                  },
                  child: Text(
                    "Quit",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ));
  }

  void correctShow() async{
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: Text("You made the right choice!"),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      guessIsCorrect();
                      Navigator.of(context).pop(false);
                      isBack = true;
                    });
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Score: ", style: scoreStyle),
                  Text("$score", style: scoreStyle),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  reCards(130, 80, updateCard[1]),
                  reCards(130, 80, updateCard[2]),
                  reCards(130, 80, updateCard[3]),
                  reCards(130, 80, updateCard[4]),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isBack
                  ? reCards(170, 100, cardBack)
                  : reCards(170, 100, gCard),
                SizedBox(width: 30),
                reCards(170, 100, updateCard[0]),
              ],
            )),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        ans = ">=";
                        GameLogic();
                        isBack = false;
                      });
                    },
                    child: btns("Greater than or Equal")),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        ans ="<";
                        GameLogic();
                        isBack = false;
                      });
                    },
                    child: btns("Less Than"))
                ],
              )
              ),
          ],
        ),
      ),
    );
  }
} 