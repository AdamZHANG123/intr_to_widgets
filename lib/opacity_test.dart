import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final title = 'Opacity Test';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OpacityTestPage(title: title),
    );
  }
}

class OpacityTestPage extends StatefulWidget {
  final String title;

  OpacityTestPage({this.title});

  @override
  _OpacityTestPageState createState() => _OpacityTestPageState();
}

class _OpacityTestPageState extends State<OpacityTestPage> {
  var _visible = true;
  var _btnText = 'Hide Text';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Opacity(
              opacity: _visible ? 1.0 : 0.0,
              child: const Text(
                'Now you see me, now you don\'t!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: 120,
              child: RaisedButton(
                child: Text(_btnText),
                onPressed: () {
                  setState(() {
                    _visible = (_btnText == 'Hide Text') ? false : true;
                    _btnText =
                        (_btnText == 'Hide Text') ? 'Show Text' : 'Hide Text';
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
