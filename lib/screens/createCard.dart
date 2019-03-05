import 'dart:io';
import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import 'dart:async';

import "./landing.dart";

class CreateCard extends StatefulWidget {
  @override
  CreateCardState createState() {
    return CreateCardState();
  }
}

class CreateCardState extends State<CreateCard> {
  File _image;  
  var userCard = {
    "name": "",
    "title": "",
    "status": "",
    "linkedIn": "",
    "avatar": ""
  };

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      userCard["avatar"] = _image.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text("Create card")),
        body: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  onChanged: (String value) {
                    setState(() {
                      userCard["name"] = value;
                    });
                  },
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  onChanged: (String value) {
                    setState(() {
                      userCard["title"] = value;
                    });
                  },
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintText: "Title",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  onChanged: (String value) {
                    setState(() {
                      userCard["status"] = value;
                    });
                  },
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintText: "Status",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  onChanged: (String value) {
                    setState(() {
                      userCard["linkedIn"] = value;
                    });
                  },
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintText: "LinkedIn",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
              Column(
                  children: _image == null
                      ? <Widget>[
                          Text(
                            "Choose Avatar from camera roll",
                            style: TextStyle(fontFamily: "Saira", fontSize: 22),
                          ),
                          SizedBox(height: 10),
                          Container(
                            child: FloatingActionButton(
                              backgroundColor: Theme.of(context).primaryColor,
                              elevation: 8,
                              onPressed: getImage,
                              tooltip: 'Pick Image',
                              child: Icon(Icons.add_a_photo),
                            ),
                          ),
                        ]
                      : <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            height: 200,
                            child: Image.file(_image),
                          ),
                          Container(
                            height: 50,
                            width: 200,
                            margin: EdgeInsets.only(top: 10),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                              color: Colors.red,
                              elevation: 8,
                              child: Text("Choose different photo",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                              onPressed: getImage,
                            ),
                          ),
                          Container(
                              child: RaisedButton(
                            elevation: 8,
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Landing(userCard)),
                              );
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            child: Text("Add"),
                          ))
                        ]),
            ],
          ),
        ),
      ),
    );
  }
}
