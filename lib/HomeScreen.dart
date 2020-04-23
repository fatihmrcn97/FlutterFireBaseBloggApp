import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'postDetails.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}



class _HomeState extends State<Home> {
  passData(DocumentSnapshot snap){
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) => PostDetails(snapshot:snap)));
  }

  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshot;
  CollectionReference collectionReference =Firestore.instance.collection("Post");

  // Override a method to get data from firestore

  @override 
  void initState() {
    // TODO: implement initState
  super.initState();
  subscription = collectionReference.snapshots().listen((datasnapshot){
    setState(() {
      snapshot = datasnapshot.documents;
    });
  });


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("My Blog App"),
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search), onPressed: () {}),
          new IconButton(icon: Icon(Icons.add), onPressed: () {})
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text("HopDayi"),
              accountEmail: Text("HopDayi.com"),
              currentAccountPicture: new Container(
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR3uxQGpPHvu2k5VYJmZCHOt5l-aRKIV4FBcjs0yLq34S-FkHq5&usqp=CAU",
                    ),
                  ),
                ),
              ),
            ),
           new ListTile(
             title: new Text("Option1"),
             leading:new Icon(Icons.cake,color:Colors.purple),
           ),
            new ListTile(
             title: new Text("Option2"),
             leading:new Icon(Icons.alarm,color:Colors.purple),
           ),
            new ListTile(
             title: new Text("Option3"),
             leading:new Icon(Icons.account_box,color:Colors.purple),
           ),
           Divider(height: 10,color: Colors.black,),
           new ListTile(
             title: new Text("Close"),
             leading:new Icon(Icons.close,color:Colors.black),
             onTap: (){Navigator.of(context).pop();},
           ),
          ],

        ),
      ),
      body: new Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(colors:[ Colors.deepOrange,Colors.amberAccent],begin: const FractionalOffset(0.5, 0.0),end: const FractionalOffset(0.0, 0.5),stops: [0,1]

          ),
        ),
        child: new ListView.builder(itemCount: snapshot.length,itemBuilder: (context,index){
          return new Card(elevation: 0,color: Colors.transparent.withOpacity(0.1),margin: EdgeInsets.all(10),child: new Container(
            padding: EdgeInsets.all(10),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new CircleAvatar(
                  child: Text(snapshot[index].data["title"][0]),
                  backgroundColor: Colors.cyanAccent,
                  foregroundColor: Colors.black,
                ),
                SizedBox(width: 6,),
                new Container(
                  width: 210,
                  child: new Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new InkWell(
                      child: Text(
                        snapshot[index].data["title"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                        maxLines: 1,
                      ),
                      onTap: (){
                        passData(snapshot[index]);

                      },
                    )
                  ],
                  ),
                )
            ],),
          ),);
        },),
        
      ),

    );
  }
}
