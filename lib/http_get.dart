import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GET Request'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _fetchData();
          },
        ),
      ),
    );
  }

  void _fetchData() async {
    var url = 'https://jsonplaceholder.typicode.com/photos';
//    var url = 'https://jsonplaceholder.typicode.com/todos/1';
    var result = await http.get(url);
    print('headers: ${result.headers}');
    print('isRedirect: ${result.isRedirect}');
    print('persistentConnection: ${result.persistentConnection}');
    print('statusCode: ${result.statusCode}');
    print('body: ${result.body}');
  }
}
