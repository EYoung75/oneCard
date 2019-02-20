import "package:flutter/material.dart";
import "package:flutter/rendering.dart";

import "./screens/auth.dart";
import "./screens/landing.dart";
import "./screens/createCard.dart";

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.blueGrey,
            accentColor: Colors.white
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            "/": (BuildContext context) => AuthPage(),
            "/landing": (BuildContext context) => Landing(),
            "/createCard": (BuildContext context) => CreateCard()
          },
    );
  }
}