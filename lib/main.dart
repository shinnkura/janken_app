import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String computerHand = "✊";
  String myHand = "✊";
  String result = "引き分け";

  void selectHand(String selectedHand) {
    myHand = selectedHand;
    generateRandomHand();
    judge();
    setState(() {});
  }

  void generateRandomHand() {
    final randomNumber = Random().nextInt(3);
    computerHand = randamNumberToHand(randomNumber);
  }

  String randamNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return "✊";
      case 1:
        return "✌️";
      case 2:
        return "🖐";
      default:
        return "✊";
    }
    // if (randomNumber == 0) {
    //   return "✊";
    // } else if (randomNumber == 1) {
    //   return "✌️";
    // } else {
    //   return "🖐";
    // }
  }

  void judge() {
    // if (computerHand == myHand) {
    //   result = "引き分け";
    // } else if (computerHand == "✊" && myHand == "✌️") {
    //   result = "負け";
    // } else if (computerHand == "✌️" && myHand == "🖐") {
    //   result = "負け";
    // } else if (computerHand == "🖐" && myHand == "✊") {
    //   result = "負け";
    // } else {
    //   result = "勝ち";
    // }
    if (myHand == computerHand) {
      result = "引き分け";
    } else if (myHand == "✊" && computerHand == "✌️" ||
        myHand == "✌️" && computerHand == "🖐" ||
        myHand == "🖐" && computerHand == "✊") {
      result = "勝ち";
    } else {
      result = "負け";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけん'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(result,
              style: TextStyle(
                fontSize: 30,
              )),
          SizedBox(height: 60),
          Text(computerHand,
              style: TextStyle(
                fontSize: 30,
              )),
          SizedBox(height: 60),
          Text(myHand,
              style: TextStyle(
                fontSize: 30,
              )),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  selectHand("✊");
                },
                child: Text("✊"),
              ),
              ElevatedButton(
                onPressed: () {
                  selectHand("✌️");
                },
                child: Text("✌️"),
              ),
              ElevatedButton(
                onPressed: () {
                  selectHand("🖐");
                },
                child: Text("🖐"),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
