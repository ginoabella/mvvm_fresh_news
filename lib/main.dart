import 'package:flutter/material.dart';
import 'package:fresh_news/pages/news_list.dart';
import 'package:fresh_news/viewmodels/news_article_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresh News',
      home: ChangeNotifierProvider(
        create: (context) => NewsArticleListViewModel(),
        child: NewsList(),
      ),
    );
  }
}
