import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // Define the Brightness and Colors
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.cyan[600],

          // Define the default Font Family
          fontFamily: 'Montserrat',
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            body1: TextStyle(fontSize: 14.0, fontFamily: 'Hid'),
          )),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orientation Example'),
      ),
      body: Column(
        children: <Widget>[
          Text(
            'Text with a background color',
            style: Theme.of(context).textTheme.title,
          ),
          Flexible(
            child: OrientationBuilder(
              builder: (context, orientation) {
                return GridView.count(
                    crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                    children: List.generate(
                      100,
                      (index) => ListTile(
                            title: Text('item $index'),
                          ),
                    ));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          accentColor: Colors.yellow,
        ),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
