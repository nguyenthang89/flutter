import 'package:flutter/material.dart';
import 'package:introduce_to_widgets/screens/carousel.dart';
import 'package:introduce_to_widgets/screens/main_menu.dart';

//void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      color: Colors.red[100],
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschinen Lakedsa Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.red[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          FavoriteWidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Container(
      color: Colors.orange[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE')
        ],
      ),
    );
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
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

    return MaterialApp(
        title: 'Flutter layout demo',
        home: Scaffold(
            backgroundColor: Colors.red[200],
            drawer: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    new SizedBox(
                      height: 60.0,
                      child: new DrawerHeader(
                          child: new Text('Categories',
                              style: TextStyle(color: Colors.white)),
                          decoration: new BoxDecoration(color: Colors.red),
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                    ),
                    ListTile(
                      leading: Icon(Icons.message),
                      title: Text('Messages'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.mediation),
                      title: Text('mediation'),
                      onTap: () {},
                    ),
                    ExpansionTile(
                      leading: Icon(Icons.wallet_giftcard),
                      title: Text("Expansion Title"),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.zero,
                          child: Container(
                              color: Colors.amber,
                              width: 300,
                              height: 30,
                              child: Text("children 1")),
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                              minWidth: double.infinity, minHeight: 10),
                          child: new Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)),
                            child: Text("children 2"),
                          ),
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                              minWidth: double.infinity, minHeight: 10),
                          child: new Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)),
                            child: Text("children 3"),
                          ),
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                              minWidth: double.infinity, minHeight: 10),
                          child: new Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)),
                            child: Text("children 4"),
                          ),
                        )
                      ],
                    ),
                    MainMenu()
                  ],
                ),
              ),
            ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: AppBar(
                title: Text('Flutter layout demo1'),
              ),
            ),
            body: ListView(
              children: [
                MyStatefulWidget2(),
                titleSection,
                buttonSection,
                Image.asset(
                  'images/lake.jpg',
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover,
                ),
                textSection,
              ],
            )));
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(label,
              style: TextStyle(
                  fontSize: 11, fontWeight: FontWeight.w500, color: color)),
        )
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}
