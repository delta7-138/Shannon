import 'package:flutter/cupertino.dart'; 
import 'package:flutter/material.dart'; 
import 'package:shannon/pages/form.dart'; 
import 'package:shannon/pages/threads.dart'; 
import 'package:firebase_core/firebase_core.dart'; 

class DrawerElem{
  String title; 
  DrawerElem(this.title);
}

class HomePage extends StatefulWidget{
  final items = [
    DrawerElem("Threads"), 
    DrawerElem("Create a thread")
  ]; 
  @override 
  _HomePageState createState() => _HomePageState(); 
}

class _HomePageState extends State<HomePage>{

  int _drawerIndex = 0;
  final Future<FirebaseApp> _init = Firebase.initializeApp();

  _selectDrawerElem(int index){
    setState(()=>{
      _drawerIndex = index
    });
    Navigator.pop(context); 
  }

   _getDrawerElem(){
    switch(_drawerIndex){
      case 0:
        return ThreadList(); 
      case 1:
        return CreatePost();
    }
  }

  @override 
  Widget build(BuildContext context){
    var drawerElems = <Widget>[]; 
    drawerElems.add(DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/shannon_betty.jpg'), 
          fit: BoxFit.cover
        )
      ),
      child: null
    ));
    for(var i = 0; i<widget.items.length; i++){
      var tmp = widget.items[i]; 
      drawerElems.add(ListTile(
        title: Text(tmp.title , style: TextStyle(color: Colors.deepPurple , fontSize: 15.0)), 
        selected: i==_drawerIndex, 
        onTap: (){
          _selectDrawerElem(i);
        }
      )); 
    }
    return FutureBuilder(
      future: _init, 
      builder: (context, snapshot){
      if(snapshot.hasError){
        return Center(child: Text('Exception Caught' , style: TextStyle(color: Colors.white)));
      }
      if(snapshot.connectionState==ConnectionState.done){
         return Scaffold(
          appBar: AppBar(backgroundColor: Colors.deepPurple, 
          title: Text('Shannon' , style: TextStyle(color: Colors.white)),
          ),
          drawer: Drawer(
            child:
          ListView(
            children: drawerElems,
          ), 
          ), 
          body: _getDrawerElem()
        ); 
      }
      return Center(child: Text('Loading...' , style: TextStyle(color: Colors.white)));
    });
  }
}