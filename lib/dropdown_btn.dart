import 'package:flutter/material.dart';

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final title = 'Dropdown Buttons';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DropDownBtnDemo(title: title),
    );
  }
}

class DropDownBtnDemo extends StatefulWidget {
  final String title;

  DropDownBtnDemo({Key key, this.title}) : super(key: key);

  @override
  _DropDownBtnDemoState createState() => _DropDownBtnDemoState();
}

class _DropDownBtnDemoState extends State<DropDownBtnDemo> {
  var dropDownValue = 'One';
  String dropDownValue2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: const Text('Simple dropdown:'),
              trailing: DropdownButton(
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: dropDownValue,
                onChanged: (value) {
                  setState(() {
                    dropDownValue = value;
                  });
                },
              ),
            ),
            SizedBox(height: 24),
            ListTile(
              leading: const Text('Dropdown with hint'),
              trailing: DropdownButton(
                hint: const Text('Choose'),
                items: <String>[
                  'One',
                  'Two',
                  'Free',
                  'Four',
                  'Can',
                  'I',
                  'Have',
                  'A',
                  'Little',
                  'Bit',
                  'More',
                  'Five',
                  'Six',
                  'Seven',
                  'Eight',
                  'Nine',
                  'Ten'
                ]
                    .map((value) =>
                    DropdownMenuItem(value: value, child: Text(value)))
                    .toList(),
                value: dropDownValue2,
                onChanged: (value) {
                  setState(() {
                    dropDownValue2 = value;
                  });
                },
              ),
            ),
//          ListTile(
//            leading: ,
//            trailing: ,
//          ),
          ],
        ),
      ),
    );
  }
}
