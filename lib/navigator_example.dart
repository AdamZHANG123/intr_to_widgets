import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final _appTitle = 'Navigator Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      home: MyHomePage(title: _appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Push'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return MyPage(title: 'My Page');
                },
              ));
            }),
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  final String title;

  MyPage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Pop'),
        ),
      ),
    );
  }
}
