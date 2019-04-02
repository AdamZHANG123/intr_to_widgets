import 'package:flutter/material.dart';

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


class CardDemoPage extends StatelessWidget {
  final String title;

  CardDemoPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: title == 'Card Layout Demo'
            ? _getFirstCardLayout()
            : _getLastCardLayout(),
      ),
    );
  }

  Widget _getFirstCardLayout() {
    return SizedBox(
      height: 210,
      child: Card(
        child: Column(
          children: <Widget>[
            _buildFirstCardItem(Icon(Icons.restaurant_menu, color: Colors.blue),
                '1625 Main Street', 'My City, CA 99984'),
            Divider(),
            _buildFirstCardItem(Icon(Icons.contact_phone, color: Colors.blue),
                '(408) 555-1212', null),
            _buildFirstCardItem(Icon(Icons.contact_mail, color: Colors.blue),
                'costa@example.com', null),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstCardItem(Icon icon, String content, String subContent) {
    final _myContentStyle = TextStyle(
      fontWeight: FontWeight.w500,
      letterSpacing: 2,
    );
    return ListTile(
      leading: (icon != null && icon is Icon) ? icon : null,
      title: content != null ? Text(content, style: _myContentStyle) : null,
      subtitle:
          subContent != null ? Text(subContent, style: _myContentStyle) : null,
    );
  }

  Widget _getLastCardLayout() {
    return ListView(
      children: List.generate(_travelDestinationList.length, (index) {
        return _buildLastCardLayout(_travelDestinationList[index]);
      }),
    );
  }

  Widget _buildLastCardLayout(TravelDestination destination) {
    return SizedBox(
      child: Card(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      destination.assetName,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 20.0,
                  child: Text(
                    destination.title,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: Text(
                destination.description,
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final _travelDestinationList = <TravelDestination>[
    TravelDestination(
      assetName: 'images/Iceland.jpg',
      title: 'Iceland',
      description:
          'Iceland is one of the safest countries on the planet. It essentially has zero violent crime and some of the best medical care in the world.',
    ),
    TravelDestination(
      assetName: 'images/Chile.jpg',
      title: 'Chile',
      description:
          'The Global Peace Index counts Chile among the safest countries in South America, with petty thievery about the only crime you have to gird yourself against.',
    ),
    TravelDestination(
      assetName: 'images/Tasmania.jpg',
      title: 'Tasmania, Australia',
      description:
          'Tasmania has little crime whatsoever, which is why it made the list. You will want to steer clear of the venomous snake populations in the island. Don’t worry though – there’s been no recorded human deaths by snake.',
    ),
    TravelDestination(
      assetName: 'images/Oman.jpg',
      title: 'Oman',
      description:
          'The crime rate in Oman is very low compared to that in most places in the west and is extremely low compared to just about anywhere in the Middle East. The Omani people are a very relaxed and polite people, which makes things quite comfortable for visitors.',
    ),
  ];
}

class TravelDestination {
  final String assetName;
  final String title;
  final String description;

  TravelDestination({this.assetName, this.title, this.description});
}
