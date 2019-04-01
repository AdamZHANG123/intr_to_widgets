import 'package:flutter/material.dart';
import 'card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<String> titleList = [
    'Card Layout Demo',
    'Another Card Layout Demo',
  ];
  final bool showFirstLayout = false;

  @override
  Widget build(BuildContext context) {
    final _title = showFirstLayout ? titleList.first : titleList.last;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CardDemoPage(title: _title),
    );
  }
}
