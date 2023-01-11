import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(
  const MyApp(),
);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int variable = Random().nextInt(5)+1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white30,
          title: const Center(
            child: Text(
              'Magic 8 Ball',
              style: TextStyle(
                fontFamily: 'SourceSansPro-Light',
                letterSpacing: 1,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: SafeArea(
            child: Expanded(
              child: MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    variable = Random().nextInt(5) + 1;
                  });
                },
                child: Image.asset('images/ball$variable.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
