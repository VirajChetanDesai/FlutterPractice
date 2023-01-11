import 'package:flutter/material.dart';
import 'package:storytime/story_brain.dart';
void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain sb = StoryBrain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration : const BoxDecoration(
          image: DecorationImage(image : AssetImage('images/background.png'),fit: BoxFit.cover),
        ),
       padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    sb.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: MaterialButton(
                  onPressed: () {
                    //Choice 1 made by user.
                    setState(() {
                      sb.nextStory(1);
                    });
                  },
                  color: Colors.red,
                  child: Text(
                    sb.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: sb.buttonShouldBeVisible(),
                  child: MaterialButton(
                    onPressed: () {
                      //Choice 2 made by user.
                      setState(() {
                        sb.nextStory(2);
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                      sb.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
