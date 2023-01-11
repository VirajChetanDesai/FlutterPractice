import 'package:flutter/material.dart';
import 'questions.dart';
import 'package:quizz/questionbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var _locked = 0;
  var _score = 0;
  List<Icon> iconList = [
    const Icon(
      Icons.done_outline,
      color: Colors.white,
    ),
  ];
  QuizBrain qb = QuizBrain();
  void checkAnswer(bool userAns) {
    setState(() {
      if (userAns == qb.getAnswer()) {
        iconList.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
        _score++;
      } else {
        iconList.add(const Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      if (qb.nextQuestion() == -1) {
        _locked = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 15.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white)
            ),
            child: Center(
              child: Text(
                qb.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              textColor: Colors.white,
              color: Colors.green,
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                if (_locked == 1) {
                  checkAnswer(false);
                  Alert(
                    context: context,
                    type: AlertType.success,
                    title: "QUIZ COMPLETE",
                    desc: "SCORE : $_score/10",
                    buttons: [
                      DialogButton(
                        onPressed: () => {
                          setState(() {
                            _score = 0;
                            _locked = 0;
                            iconList = [
                              const Icon(
                                Icons.done_outline,
                                color: Colors.white,
                              ),
                            ];
                            qb.init(0);
                            Navigator.pop(context);
                          }),
                        },
                        width: 120,
                        child: const Text(
                          "RESTART",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ).show();
                } else {
                  checkAnswer(true);
                }
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (_locked == 1) {
                  checkAnswer(false);
                  Alert(
                    context: context,
                    type: AlertType.success,
                    title: "QUIZ COMPLETE",
                    desc: "SCORE : $_score/10",
                    buttons: [
                      DialogButton(
                        onPressed: () => {
                          setState(() {
                            _score = 0;
                            _locked = 0;
                            iconList = [
                              const Icon(
                                Icons.done_outline,
                                color: Colors.white,
                              ),
                            ];
                            qb.init(0);
                            Navigator.pop(context);
                          })
                        },
                        width: 120,
                        child: const Text(
                          "RESTART",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ).show();
                } else {
                  checkAnswer(false);
                }
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: iconList,
          ),
        ),
      ],
    );
  }
}
