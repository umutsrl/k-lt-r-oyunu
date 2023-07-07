import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

import 'constants.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  int eleman = 0; //hangi soruda olduğumuzu tutar
  List<String> sorular = [
    'titanic en büyük gemidir',
    'elon musk teslanın işçisidir',
    'Atatürk 1939 yılında vefat etmiştir',
    'bMW İSPANYOL otomobilidir',
    'Türkiye asya-avrupa arasında kıtadadır.',
  ];
  List<bool> cevaplar = [
    true,
    false,
    false,
    false,
    true,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  sorular[eleman],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Wrap(
            children: secimler,
          ),
          Expanded(
            flex: 1,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.0),
                child: Row(children: <Widget>[
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: ElevatedButton(
                            child: Icon(
                              Icons.thumb_down,
                              size: 30.0,
                            ),
                            onPressed: () {
                              bool answer = cevaplar[eleman];
                              setState(() {
                                eleman = eleman + 1;
                                if (answer == false) secimler.add(smile);
                                if (answer == true) secimler.add(bad);
                              });
                            },
                          ))),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: ElevatedButton(
                            child: Icon(Icons.thumb_up, size: 30.0),
                            onPressed: () {
                              bool answer = cevaplar[eleman];
                              setState(() {
                                eleman = eleman + 1;
                                if (answer == true) secimler.add(smile);
                                if (answer == false) secimler.add(bad);
                              });
                            },
                          ))),
                ])),
          )
        ],
      ),
    );
  }
}

// Icon smile = Icon(
//   Icons.mood,
//   color: Colors.red,
// );
// Icon bad = Icon(
//   Icons.mood_bad,
//   color: Colors.deepOrange,
// );
