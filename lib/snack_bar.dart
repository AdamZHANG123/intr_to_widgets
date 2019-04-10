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
        title: Text('Snack Bar Example'),
      ),
      body: Center(
        child: SelectionButton(),
      ),
    );
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => _navigateToSelection(context),
      child: Text('Pick an option'),
    );
  }

  _navigateToSelection(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => SelectionPage(),
        ));

    if (result != null) {
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text('You picked $result'),
        ));
    } else {
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text("You didn't pick."),
        ));
    }
  }
}

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an Option'),
      ),
      body: Center(
          child: Row(
        children: <Widget>[
          RaisedButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.pop(context, 'Yes');
            },
          ),
          RaisedButton(
            child: Text('No'),
            onPressed: () {
              Navigator.pop(context, 'No');
            },
          ),
        ],
      )),
    );
  }
}
