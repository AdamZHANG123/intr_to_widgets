import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final _appTitle = 'State Management';
  final _approachA = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_appTitle),
        ),
        body: Center(
          child: _approachA ? TapBoxA() : ParentWidget(),
        ),
      ),
    );
  }
}

// This module manages a widget's State instance in 3 different approaches.

// Approach A: the widget itself manages its own state, in this case the widget
// must be a StatefulWidget.

// -------------------- Approach A started -----------------------
class TapBoxA extends StatefulWidget {
  @override
  _TapBoxAState createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {
  var _active = true;

  void _handleTapEvent() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTapEvent,
      child: Container(
        width: 200,
        height: 200,
        color: _active ? Colors.green : Colors.grey,
        child: Center(
          child: Text(
            'TapBoxA\n' + (_active ? 'Active' : 'Inactive'),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 36, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
// --------------------  Approach A ended  -----------------------

// This class is the Parent Widget of both TapBoxB and TapBox C, so it involves
// in both approach B and C.
class ParentWidget extends StatefulWidget {
  final _approachB = false;

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  var active = true;

  void tapEventHandler() {
    setState(() {
      active = !active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget._approachB
        ? TapBoxB(active: active, onTap: tapEventHandler)
        : TapBoxC(active: active, onTap: tapEventHandler);
  }
}

// Approach B:  The widget's state is managed by its parent widget (not by
// itself). In this case, the widget could be a StatelessWidget, since it does
// not to maintain the state itself anymore.

// -------------------- Approach B started -----------------------
class TapBoxB extends StatelessWidget {
  final VoidCallback onTap;
  final bool active;

  TapBoxB({this.active, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 200,
        color: active ? Colors.green : Colors.grey,
        child: Center(
          child: Text(
            'TapBoxB\n' + (active ? 'Active' : 'Inactive'),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 36, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// --------------------  Approach B ended  -----------------------

// Approach C: A mix-and-match approach.
// In this case, both the TapBoxC and ParentWidget(its parent Widget) maintain
// their own state, which focus on different part of mutable information respectively.

// -------------------- Approach C started -----------------------
class TapBoxC extends StatefulWidget {
  final VoidCallback onTap;
  final bool active;

  TapBoxC({this.active, this.onTap});

  @override
  _TapBoxCState createState() => _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC> {
  var _highlight = false;

  void _handleTapDownEvent(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUpEvent(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _handleTapDownEvent,
      onTapUp: _handleTapUpEvent,
      onTapCancel: _handleTapCancel,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: widget.active ? Colors.green : Colors.grey,
          border: _highlight ? Border.all(width: 3.0, color: Colors.red) : null,
        ),
        child: Center(
          child: Text(
            'TapBoxC\n' + (widget.active ? 'Active' : 'Inactive'),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 36, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
// --------------------  Approach C ended  -----------------------
