// import 'dart:convert';
import 'package:flutter/material.dart'; 
import 'package:flutter/cupertino.dart'; 
// import 'package:firebase_storage/firebase_storage.dart' as fb;
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart'; 
// import 'package:firebase_core/firebase_core.dart'; 

class CreatePost extends StatefulWidget{
  @override 
  _CreatePostState createState() => _CreatePostState(); 
}

class _CreatePostState extends State<CreatePost>{
  final _formKey = GlobalKey<FormState>();
  String title = "";
  String description = "";
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final mainDB = FirebaseDatabase.instance.reference();

  @override 
  void dispose(){
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }
  @override 
  Widget build(BuildContext context){
      return Scaffold(
      body: ExpansionTile(title: Text('Create a thread' , style: GoogleFonts.getFont('Source Code Pro' , textStyle: TextStyle(color: Colors.red[900]))) , children: [Form(
      key: _formKey, 
      child: Column(children: [
        TextFormField(
          controller: titleController,
          validator: (value){
            if(value==null || value.isEmpty){
              return "Please enter a title";
            }else{
              title = value;
            }
          },
          style: GoogleFonts.getFont('Source Code Pro' , textStyle: TextStyle(color: Colors.red[900])), 
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(15),
            hintText: 'Enter the title for the post', 
            hintStyle: TextStyle(color: Colors.grey)
          ),
        ), 
        TextFormField(
          controller: descController,
          validator: (value){
            if(value==null || value.isEmpty){
              return "Please enter a description"; 
            }else{
              description = value;
            }
          }, style:GoogleFonts.getFont('Source Code Pro' , textStyle: TextStyle(color: Colors.red[900])), 
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(15),
            hintText: 'Enter the description for the post', 
            hintStyle: TextStyle(color: Colors.grey)
          )
        ), 
        ElevatedButton(child: Text('Submit'), 
        onPressed: (){
          if (_formKey.currentState!.validate()){
            print(title + " " + description);
            mainDB.push().set({'title' : title , 'description' : description});
          }
          titleController.clear();
          descController.clear();
          showDialog(context: context, builder: (context){
            return AlertDialog(
              content: Text('Successfully done!'),
            ); 
          }); 
        }
        ,
        style: ElevatedButton.styleFrom(
          primary: Colors.deepPurpleAccent[400], 
          textStyle: GoogleFonts.getFont('Press Start 2P' , textStyle: TextStyle(color: Colors.white))
        ))
      ],)
    )])); 
}}