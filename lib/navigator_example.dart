import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 12,
        ),
        child: ListView(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return MyFirstPage();
                  },
                ));
              },
              child: Text('Navigate to 1st Page'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return MySecondPage();
                  },
                ));
              },
              child: Text('Navigate to 2nd Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page One'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 24,
        ),
        child: ListView(
          children: <Widget>[
            Center(
              child: Text('Click the button to return to homepage.'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Return to Homepage'),
            ),
          ],
        ),
      ),
    );
  }
}

class MySecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Two'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 24,
        ),
        child: ListView(
          children: <Widget>[
            Center(
              child: Text('Click the button to return to homepage.'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Return to Homepage'),
            ),
          ],
        ),
      ),
    );
  }
}
