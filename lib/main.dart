import 'package:flutter/material.dart';
import 'package:qreader/src/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  static const String _titulo = 'Home';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _titulo,
      initialRoute: 'home',

      routes: {
        'home' : (BuildContext context) => HomePage()

      }, 
      theme: ThemeData(
        primaryColor: Color.fromRGBO(32, 32, 32, 1),
      ),
    );
  }
}