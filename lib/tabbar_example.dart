import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('TabBar Demo'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  child: Icon(Icons.directions_car),
                ),
                Tab(
                  child: Icon(Icons.directions_bike),
                ),
                Tab(
                  child: Icon(Icons.directions_transit),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              // Content for First tab (with the icon directions_car)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('This is the Car Tab'),
                  SizedBox(height: 20),
                  Icon(Icons.directions_car),
                ],
              ),
              // Content for Second tab (with the icon directions_bike)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('This is the Bike Tab'),
                  SizedBox(height: 20),
                  Icon(Icons.directions_bike),
                ],
              ),
              // Content for Third tab (with the icon directions_transit)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('This is the Transit Tab'),
                  SizedBox(height: 20),
                  Icon(Icons.directions_transit),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
