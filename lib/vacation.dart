import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VacationPage(),
    );
  }
}

class VacationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.settings),
        title: Text('Vacation Choice'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            child: Icon(Icons.map),
          ),
        ],
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: ListView(
          children: <Widget>[
            _buildBigPicture(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  _buildIntroduceInfoTile(),
                  _buildBtnBar(),
                  _buildDetailedIntr(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBigPicture() {
    return Image.asset(
      'images/Lake.jpg',
      fit: BoxFit.scaleDown,
    );
  }

  Widget _buildIntroduceInfoTile() {
    return ListTile(
      title: Text(
        'Oeschinen Lake Campground',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'Kandersteg, Switzerland',
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
      trailing: FavoriteNumber(),
    );
  }

  Widget _buildBtnBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildBtnBarColumn(Icon(Icons.phone, color: Colors.blue), 'call'),
          _buildBtnBarColumn(
              Icon(Icons.directions, color: Colors.blue), 'route'),
          _buildBtnBarColumn(Icon(Icons.share, color: Colors.blue), 'share'),
        ],
      ),
    );
  }

  Widget _buildBtnBarColumn(Icon icon, String text) {
    return Column(
      children: <Widget>[
        icon,
        SizedBox(
          height: 8,
        ),
        Text(
          text.toUpperCase(),
          style: TextStyle(fontSize: 16, color: Colors.blue),
        ),
      ],
    );
  }

  Widget _buildDetailedIntr() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
  }
}

class FavoriteNumber extends StatefulWidget {
  @override
  _FavoriteNumberState createState() => _FavoriteNumberState();
}

class _FavoriteNumberState extends State<FavoriteNumber> {
  var number = 41;
  var alreadyFavored = true;

  void _iconTapped() {
    setState(() {
      alreadyFavored ? number-- : number++;
      alreadyFavored = !alreadyFavored;
    });
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _iconTapped,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 80,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                alreadyFavored ? Icons.star : Icons.star_border,
                color: alreadyFavored ? Colors.yellow[700] : Colors.grey,
                size: 32,
              ),
              Text(
                number.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: alreadyFavored ? Colors.yellow[700] : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

