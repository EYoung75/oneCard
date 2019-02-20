import "package:flutter/material.dart";

class AuthPage extends StatefulWidget {
  @override
  AuthPageState createState() {
    return AuthPageState();
  }
}

class AuthPageState extends State<AuthPage> {
  String _email = "";
  String _password = "";
  bool firstEntry = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("oneCard"),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Text("Login"),
            SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Email:"),
              onChanged: (String value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Password:"),
              onChanged: (String value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                "Login",
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
              onPressed: () {
                if (firstEntry == true) {
                  Navigator.pushReplacementNamed(context, "/createCard");
                } else {
                  Navigator.pushReplacementNamed(context, "/landing");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
