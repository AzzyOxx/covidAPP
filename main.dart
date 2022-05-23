// adicionar em 
// android/app/src/AndroidManifest.xml
// <uses-permission android:name="android.permission.INTERNET"/>
// entre a 1 tag <manifest e <aplicatio 

// adicionar em 
// /pubspec.yaml
// dependecies:
//  http: ^0.13.4 
// ou executar: flutter pub add http

// adicionar em 
// /pubspec.yaml
// dependecies:
//  html: ^0.15.0 
// ou executar: flutter pub add html

// how fix flutter cors error only dart code =>

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meu app",
      initialRoute: '/',
      routes: {
        '/': (context) => WebScraping(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}



class WebScraping extends StatefulWidget {
  const WebScraping({Key? key}) : super(key: key);

  @override
  State<WebScraping> createState() => _WebScrapingState();
}

class Article {
  final String url;
  final String title;
  final String urlImage;

  const Article(
      {required this.url, required this.title, required this.urlImage});
}

class _WebScrapingState extends State<WebScraping> {
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();

    getWebsiteData();
  }

  /* 'https://www.amazon.com/s?k=iphone' */

  Future getWebsiteData() async {
    final url = Uri.parse(
        'https://especiais.g1.globo.com/bemestar/coronavirus/estados-brasil-mortes-casos-media-movel/');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final titles = html
        .querySelectorAll(
            'body > main > div.visual-content > div > section.states-status > section:nth-child(20) > div > div:nth-child(1) > div > div:nth-child(1) > span')
        .map((element) => element.innerHtml.trim())
        .toList();

    print('Count: ${titles.length}');

    setState(() {
      articles = List.generate(
        titles.length,
        (index) => Article(
          url: '',
          title: titles[index],
          urlImage: '',
        ),
      );
    });
    for (final title in titles) {
      debugPrint(title);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web Scraping'),
        centerTitle: true,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];
            return ListTile(
              title: Text(article.title),
            );
          }),
    );
  }
}
