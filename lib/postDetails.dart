import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostDetails extends StatefulWidget {

  DocumentSnapshot snapshot;
  PostDetails({this.snapshot});

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Post Details"),
        backgroundColor: Colors.amber,

      ),
      body: new Card(
        elevation: 10,
        margin: EdgeInsets.all(10),
        child: new ListView(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(6),
              child: Row(
                children: <Widget>[
                  new CircleAvatar(
                    child: Text(widget.snapshot.data["title"][0],),
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white
                  ),
                  SizedBox(width: 10,),
                  new Text(widget.snapshot.data["title"],style: TextStyle(fontSize: 22.0,color: Colors.greenAccent),),

                ],
              ),
            ),
            SizedBox(width: 7,),
            new Container(
              margin: EdgeInsets.all(10),
              child: Text(widget.snapshot.data["content"],style: TextStyle(fontSize: 18.0,color: Colors.lightGreenAccent),),
            )
          ],
        ),
      ),

    );
  }
}
