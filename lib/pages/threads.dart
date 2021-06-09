//import 'package:firebase_core/firebase_core.dart';
//import 'dart:convert';
import "package:flutter/material.dart"; 
import "package:flutter/cupertino.dart"; 
import "package:firebase_database/firebase_database.dart";
import 'package:google_fonts/google_fonts.dart';

class Thread{
  String title; 
  String description;
  Thread(this.title , this.description);
}

class ThreadList extends StatefulWidget{
  @override 
  _ThreadListState createState() => _ThreadListState(); 
}

class _ThreadListState extends State<ThreadList>{
  final mainDB = FirebaseDatabase.instance.reference();
  List <Thread> threadList = [];

  
  @override 
  Widget build(BuildContext context){
    List<Container> listItems = [];
    for(int i = 0; i<threadList.length; i++){
      var thread = threadList.elementAt(i);
      var item = new Container(child: ExpansionTile(title: Row(children: [Expanded(
        child: Text(thread.title , style : GoogleFonts.getFont('Source Code Pro' , textStyle: TextStyle(color: Colors.red[900])))), Icon(Icons.article_sharp ,color: Colors.red[900])]))
      );
      listItems.add(item);
    }
    return Scaffold(
      body: ListView(children: listItems)
    );
  }
}