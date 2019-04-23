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
  var _formKey = GlobalKey<FormState>();
  final String _emptyPrompt = 'Field can NOT be empty';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Field Example'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
          children: <Widget>[
            SizedBox(height: 16),
            Row(
              children: <Widget>[
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'First name',
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      return value.isEmpty ? _emptyPrompt : null;
                    },
                    keyboardAppearance: Brightness.light,
                  ),
                ),
                SizedBox(width: 16),
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Last name',
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      return value.isEmpty ? _emptyPrompt : null;
                    },
                    keyboardAppearance: Brightness.light,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                icon: Icon(Icons.person_pin),
                suffixText: '@gmail.com',
                filled: true,
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                return value.isEmpty ? 'Username can NOT be empty' : null;
              },
              keyboardAppearance: Brightness.light,
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                icon: Icon(Icons.lock),
                filled: true,
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                return value.isEmpty ? 'Password can NOT be empty' : null;
              },
              keyboardAppearance: Brightness.light,
              obscureText: true,
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Confirm',
                icon: Icon(Icons.lock),
                filled: true,
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                return value.isEmpty ? 'Confirm can NOT be empty' : null;
              },
              keyboardAppearance: Brightness.light,
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _getInputDecoration(
      {String name, String suffixText, Icon icon}) {
    return InputDecoration(
      icon: icon,
      labelText: name,
      filled: true,
      border: OutlineInputBorder(),
      suffixText: (suffixText == null) ? null : suffixText,
    );
  }
}
