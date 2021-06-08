import 'package:flutter/material.dart'; 
import 'package:flutter/cupertino.dart'; 
import 'package:firebase_core/firebase_core.dart';

class CreatePost extends StatefulWidget{
  @override 
  _CreatePostState createState() => _CreatePostState(); 
}

class _CreatePostState extends State<CreatePost>{
  final _formKey = GlobalKey<FormState>();
  final Future<FirebaseApp> _initObj = Firebase.initializeApp();
  

  @override 
  Widget build(BuildContext context){
    // if(_error){
    //   return Center(child: Text('Exception caught'));
    // }
    // if(! _init){
    //   return Center(child: Text('Loading right now'));
    // }
    return FutureBuilder(
      future: _initObj, 
      builder: (context , snapshot){
        if(snapshot.hasError){
          return Center(child: Text('Caught exception' , style: TextStyle(color: Colors.white)));
        }

        if(snapshot.connectionState== ConnectionState.done){
              return Scaffold(
              body: ExpansionTile(title: Text('Create a thread' , style: TextStyle(color: Colors.white)) , children: [Form(
              key: _formKey, 
              child: Column(children: [
                TextFormField(
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "Please enter a title";
                    }
                  },
                  style: TextStyle(
                    color: Colors.white
                  ), 
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    hintText: 'Enter the title for the post', 
                    hintStyle: TextStyle(color: Colors.grey)
                  ),
                ), 
                TextFormField(
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "Please enter a description"; 
                    }
                  }, style:(
                    TextStyle(color: Colors.white)
                  ), 
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    hintText: 'Enter the description for the post', 
                    hintStyle: TextStyle(color: Colors.grey)
                  )
                ), 
                ElevatedButton(child: Text('Submit'), 
                onPressed: (){
                  if (_formKey.currentState!.validate()){
                    print('done');
                  }
                }
                ,
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple
                ))
              ],)
            )])); 
        }
        return Center(child: Text('Loading!', style: TextStyle(color: Colors.white))); 
      }
    ); 
  }
}