import 'package:flutter/material.dart';
 



import 'package:examen_topicos/src/pages/home_page.dart';
import 'package:examen_topicos/src/pages/login_page.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => LoginPage(),
        'home': (BuildContext cotext) => HomePage(),
        
      },
      
    );
  }
}