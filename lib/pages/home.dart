import 'package:flutter/cupertino.dart'; 
import 'package:flutter/material.dart'; 
//import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget{
  @override 
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home>{
  @override 
  Widget build(BuildContext context){
    return Center(child: Image(image : AssetImage('assets/shannon_claude.png'),));
  }
}