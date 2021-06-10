//import 'package:firebase_core/firebase_core.dart';
//import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
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
  Query _mainDB = FirebaseDatabase.instance.reference();
  List <Thread> threadList = [];
  List <Widget> listItems = [];

  @override 
  void initState(){
    super.initState();
    _mainDB = FirebaseDatabase.instance.reference();
  }
  void flushData(){
    threadList = [];
  }

  @override 

  Widget build(BuildContext context){ 
    return Scaffold(
      body: Container(
        child: FirebaseAnimatedList(query: _mainDB , itemBuilder:(BuildContext context , DataSnapshot snapshot , Animation<double>anim , int x){
          return Container(decoration : BoxDecoration(border : Border.all(width : 0.5 , color: Colors.white)) , margin: EdgeInsets.all(8), child: ExpansionTile(title:Text(snapshot.value["title"] , style:
          GoogleFonts.getFont('Source Code Pro' , textStyle: TextStyle(color: Colors.red[900])),), 
          children: [
            Container(child:  
              Text(snapshot.value["description"] , style: GoogleFonts.getFont('Source Code Pro' , textStyle: TextStyle(color : Colors.limeAccent))), 
              padding: EdgeInsets.all(10), 
              margin : EdgeInsets.all(15)
            )
          ],));
        } )
      )
    );
}}