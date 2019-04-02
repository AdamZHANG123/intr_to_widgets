import 'package:flutter/material.dart';
import 'dart:math';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TransformExample(),
    );
  }
}

class TransformExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transform Example'),
      ),
//      body: _rotateTransform(),
//      body: _scaleTransform(),
      body: _translateTransform(),
    );
  }

  Widget _rotateTransform() {
    return Transform.rotate(
//          origin: Offset(50, 50),
      angle: pi / 2.0,
      child: _buildContainer(),
    );
  }

  Widget _scaleTransform() {
    return Transform.scale(
      scale: 0.6,
      origin: Offset(50.0, 50.0),
      child: _buildContainer(),
    );
  }

  Widget _translateTransform() {
    return Transform.translate(
      offset: Offset(100.0, 0.0),
      child: _buildContainer(),
    );
  }

  Widget _buildContainer() {
    return Container(
      height: 200.0,
      width: 200.0,
      color: Colors.blue,
      child: const Text(
        'Apartment for rent!',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
