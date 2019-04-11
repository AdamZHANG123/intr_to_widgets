import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => HomePage(),
        '/another': (context) => AnotherPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text.rich(
              TextSpan(
                text: 'Click the ',
                children: <TextSpan>[
                  TextSpan(
                    text: 'Icon ',
                    style: TextStyle(
                      color: Colors.red,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  TextSpan(
                    text: 'below to check the animation.',
                  ),
                ],
              ),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/another');
                },
                child: Hero(
                  tag: 'lakeImage',
                  child: Icon(
                    Icons.slow_motion_video,
                    size: 80,
                    color: Colors.red,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Hero(
                  tag: 'lakeImage',
                  child: Icon(
                    Icons.slow_motion_video,
                    size: 80,
                    color: Colors.green,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
