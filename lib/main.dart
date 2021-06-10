import 'package:flutter/material.dart';
import 'package:shannon/pages/homepage.dart'; 
import 'package:google_fonts/google_fonts.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shannon',
      theme: new ThemeData(scaffoldBackgroundColor: Colors.black38 , accentColor: Colors.red[900], 
          textTheme: TextTheme(
          bodyText1: GoogleFonts.getFont('Roboto Mono' , textStyle: TextStyle(color: Colors.white)),
          bodyText2: GoogleFonts.getFont('Roboto Mono' , textStyle: TextStyle(color: Colors.white)),
        ).apply(
          bodyColor: Colors.black, 
          displayColor: Colors.black, 
        )
      ),
      home: HomePage()
    );
  }
}