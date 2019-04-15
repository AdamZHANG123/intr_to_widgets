import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another SnackBar Demo'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 12,
        ),
        child: Column(
          children: <Widget>[
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
              ),
            ),
            MySnackBarButton(),
          ],
        ),
      ),
    );
  }
}

class MySnackBarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Show SnackBar'),
      onPressed: () {
        _showMySnackBar(context);
      },
    );
  }

  void _showMySnackBar(BuildContext context) {
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text('You clicked Button'),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
            label: 'dismiss',
            onPressed: () {
              _dismissMySnackBar(context);
            }),
      ));
  }

  void _dismissMySnackBar(BuildContext context) {
    Scaffold.of(context).removeCurrentSnackBar();
  }
}
