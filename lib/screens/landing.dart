import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:qr_flutter/qr_flutter.dart';



class Landing extends StatelessWidget {
  final userCard;

  Landing(this.userCard);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("oneCard"),
      ),
      body: Container(margin: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            Text('Welcome, ${userCard["name"]}', style: TextStyle(fontSize: 26),),
            VirtualCard(userCard),
          ],
        )
      )
    );
  }
}

class VirtualCard extends StatelessWidget {
  final userCard;

  VirtualCard(this.userCard);

    @override
    Widget build(BuildContext context) {
      return Material(
        child: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(50, 20, 50, 30),
            height: 425,
            child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          front: Card(
            elevation: 30,
            child: Column(
              children: <Widget>[
                Image.file(userCard["avatar"]),
                Text(userCard["name"]),
                Text(userCard["title"]),
                Text(userCard["status"])
              ],
            ),
          ),
          back: Card(
            elevation: 15,
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    QrImage(
                      version: 15,
                      data: userCard.toString(),
                      size: 250.0
                    ),
                    Text("Scan to share", style: TextStyle(fontSize: 20.0)),
                  ],
                )
          ),
        )
            ),
          ),
      
      );
    }
  }