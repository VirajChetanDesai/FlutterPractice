import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Center(
            child: Text(
              "Dice Roller",
              style: TextStyle(
                fontFamily: 'SourceSansPro-Light',
                letterSpacing: 1,
              ),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Dicepage(),
      ),
    ),
  );
}
class Dicepage extends StatefulWidget {
  const Dicepage({Key? key}) : super(key: key);

  @override
  State<Dicepage> createState() => _DicepageState();
}

class _DicepageState extends State<Dicepage> {
  int diceno1 = Random().nextInt(6)+1;
  int diceno2 = Random().nextInt(6)+1;
  void randomizer(){
    setState(() {
      diceno1 = Random().nextInt(6)+1;
      diceno2 = Random().nextInt(6)+1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextButton(
                  onPressed: (){
                    randomizer();
                  },
                  child: Image.asset('images/dice-$diceno1.png'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    randomizer();
                  },
                  child: Image.asset('images/dice-$diceno2.png'),
                ),
              )
            ],
          ),
        )
    );
  }
}


