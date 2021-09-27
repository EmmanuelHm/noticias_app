import 'package:flutter/material.dart';
import 'package:noticias_app/src/pages/tabs_page.dart';
import 'package:noticias_app/src/theme/tema.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noticias App',
      theme: miTema,
      home: TabsPage(),
    );
  }
}
