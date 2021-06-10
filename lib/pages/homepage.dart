import 'package:flutter/cupertino.dart'; 
import 'package:flutter/material.dart'; 
import 'package:shannon/pages/form.dart'; 
import 'package:shannon/pages/threads.dart'; 
import 'package:shannon/pages/home.dart'; 
import 'package:firebase_core/firebase_core.dart'; 
import 'package:google_fonts/google_fonts.dart';

class DrawerElem{
  String title; 
  Icon icon;
  DrawerElem(this.title , this.icon);
}

class HomePage extends StatefulWidget{
  final items = [
    DrawerElem("Home" , Icon(Icons.home , color: Colors.deepPurpleAccent[400])), 
    DrawerElem("Threads" ,  Icon(Icons.article_sharp , color: Colors.deepPurpleAccent[400])), 
    DrawerElem("Create a thread" , Icon(Icons.add_box_sharp , color: Colors.deepPurpleAccent[400]))
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
        return Home();
      case 1:
        return ThreadList();
      case 2:
        return CreatePost();
    }
  }

  @override 
  Widget build(BuildContext context){
    var drawerElems = <Widget>[]; 
    drawerElems.add(DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/shannon_claude.png'), 
          fit: BoxFit.cover
        )
      ),
      child: null
    ));
    for(var i = 0; i<widget.items.length; i++){
      var tmp = widget.items[i]; 
      drawerElems.add(ListTile(
        leading: tmp.icon, 
        title: Text(tmp.title , style: TextStyle(color: Colors.deepPurpleAccent[400], fontSize: 15.0)), 
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
          appBar: AppBar(backgroundColor: Colors.deepPurpleAccent[400], 
          title: Text('Shannon' , style: GoogleFonts.getFont('Press Start 2P' , textStyle: TextStyle(color: Colors.white)))
          ),
          drawer: Drawer(child:
            Container( 
              color: Colors.black, 
              child:
            ListView(
              children: drawerElems,
            ), 
            )), 
          body: _getDrawerElem()
        ); 
      }
      return Center(child: Text('Loading...' , style: TextStyle(color: Colors.white)));
    });
  }
}