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
  var _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another TabBar Demo'),
      ),
      body: _showTab(_tabIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            title: Text('Car'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bike),
            title: Text('Bike'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_transit),
            title: Text('Transit'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _tabIndex = index;
            print(index);
          });
        },
      ),
    );
  }

  Widget _showTab(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return CarPage();
      case 1:
        return BikePage();
      default:
        return TransitPage();
    }
  }
}

class CarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Car'),
    );
  }
}

class BikePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Bike'),
    );
  }
}

class TransitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Transit'),
    );
  }
}
