import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/firstPage': (BuildContext context) => MyFirstPage(title: '1st Page'),
        '/secondPage': (BuildContext context) =>
            MySecondPage(title: '2nd Page'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showText;

  Widget _showTextOrNot() {
    if (_showText == null) {
      return Center(
        child: Text("You haven't pick yet."),
      );
    } else if (_showText) {
      return Center(
        child: Text('You clicked "Yes".'),
      );
    } else {
      return Center(
        child: Text('You clicked "No".'),
      );
    }
  }

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
                Navigator.pushNamed(context, '/firstPage');
              },
              child: Text('Navigate to 1st Page'),
            ),
            RaisedButton(
              onPressed: () async {
                dynamic result =
                    await Navigator.pushNamed(context, '/secondPage');
                setState(() {
                  if (result is bool) {
                    _showText = result;
                  } else {
                    _showText = null;
                  }
                });
              },
              child: Text('Navigate to 2nd Page'),
            ),
            _showTextOrNot(),
          ],
        ),
      ),
    );
  }
}

class MyFirstPage extends StatelessWidget {
  final String title;

  MyFirstPage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
  final String title;

  MySecondPage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 24,
        ),
        child: ListView(
          children: <Widget>[
            Center(
              child: Text(
                'Do you want to show the text?',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text('Yes'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text('No'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
