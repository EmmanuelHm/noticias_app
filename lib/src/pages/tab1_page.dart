import 'package:flutter/material.dart';
import 'package:noticias_app/src/services/news_service.dart';
import 'package:noticias_app/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsService>(context).headlines;

    return ListaNoticias(headlines);
  }
}
