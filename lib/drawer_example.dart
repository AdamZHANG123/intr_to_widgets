import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/': (context) => HomePage(),
        '/pageOne': (context) => PageOne(),
        '/pageTwo': (context) => PageTwo(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: _getDrawer(context),
      body: _getBody(context),
    );
  }

  Widget _getDrawer(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
//            DrawerHeader(
//              decoration: BoxDecoration(
//                color: Colors.blue,
//              ),
//              child: Text(
//                'Drawer Header',
//                style: TextStyle(
//                  color: Colors.white,
//                  fontSize: 18,
//                ),
//              ),
//            ),
            Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
              color: Colors.blue,
              child: ListTile(
                title: Text(
                  'Text Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _navigateTo(context, '/pageOne');
              },
              child: ListTile(
                title: Text('Page One'),
              ),
            ),
            GestureDetector(
              onTap: () {
                _navigateTo(context, '/pageTwo');
              },
              child: ListTile(
                title: Text('Page Two'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ListTile(
                title: Text('Dismiss'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      constraints: BoxConstraints.expand(),
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Page One'),
            onPressed: () {
              _navigateTo(context, '/pageOne');
            },
          ),
          RaisedButton(
            child: Text('Page Two'),
            onPressed: () {
              _navigateTo(context, '/pageTwo');
            },
          ),
        ],
      ),
    );
  }

  Future<T> _navigateTo<T extends Object>(
      BuildContext context, String routeName) {
    return Navigator.pushNamed(context, routeName);
  }
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page One'),
      ),
      body: Center(
        child: Text('Welcome to Page One!'),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Two'),
      ),
      body: Center(
        child: Text('Welcome to Page Two!'),
      ),
    );
  }
}
