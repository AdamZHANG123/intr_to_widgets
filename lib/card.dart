import 'package:flutter/material.dart';

class MyCardDemoPage extends StatelessWidget {
  final String title;

  MyCardDemoPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          height: 210,
          child: Card(
            child: Column(
              children: <Widget>[
                MyListTile(
                  icon: Icon(
                    Icons.restaurant_menu,
                    color: Colors.blue,
                  ),
                  content: '1625 Main Street',
                  subContent: 'My City, CA 99984',
                ),
                Divider(),
                MyListTile(
                  icon: Icon(
                    Icons.contact_phone,
                    color: Colors.blue,
                  ),
                  content: '(408) 555-1212',
                ),
                MyListTile(
                  icon: Icon(
                    Icons.contact_mail,
                    color: Colors.blue,
                  ),
                  content: 'costa@example.com',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  final _myContentStyle = TextStyle(
    fontWeight: FontWeight.w500,
    letterSpacing: 2,
  );
  final Widget icon;
  final String content;
  final String subContent;

  MyListTile({Key key, this.icon, this.content, this.subContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: (icon != null && icon is Icon) ? icon : null,
      title: content != null
          ? Text(
        content,
        style: _myContentStyle,
      )
          : null,
      subtitle: subContent != null
          ? Text(
        subContent,
        style: _myContentStyle,
      )
          : null,
    );
  }
}