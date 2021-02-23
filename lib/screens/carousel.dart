import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStatefulWidget2 extends StatefulWidget {
  State createState() => new MyStatefulWidget2State();
}

class MyStatefulWidget2State extends State<MyStatefulWidget2> {
  int _currentIndex = 0;

  List cardList = [Item1(), Item2()];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        pauseAutoPlayOnTouch: true,
        aspectRatio: 2.0,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      items: cardList.map((card) {
        return Builder(builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width,
            child: Card(
              color: Colors.amber,
              child: card,
            ),
          );
        });
      }).toList(),
    );
  }
}

class Item2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.3, 1],
        colors: [
          Color(0xffff4000),
          Color(0xffffcc66),
        ],
      )),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold),
            ),
          ]),
    );
  }
}

class Item1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xff5f2c82), Color(0xff49a09d)]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/lake.jpg',
            height: 180.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
