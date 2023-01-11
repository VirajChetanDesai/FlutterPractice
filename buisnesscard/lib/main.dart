import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[400],
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('images/img.jpg'),
                ),
                Container(
                  child: Text(
                    "Viraj Desai",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'FLUTTER DEVELOPER',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'SourceSansPro-Light',
                        letterSpacing: 2),
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 90,
                  child: Divider(
                    color: Colors.blue.shade100,
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.blue[700],
                    ),
                    title : Text(
                      '+91-7400237587',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'SourceSansPro-Light',
                        color: Colors.blue[700],
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.blue[700],
                    ),
                    title : Text(
                      'virajdesai1227@gmail.com',
                      style: TextStyle(
                        fontFamily: 'SourcePro-Light',
                        fontSize: 18,
                        color: Colors.blue[700],
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                ),
              ]),
        ),
      ),
    );
  }
}

