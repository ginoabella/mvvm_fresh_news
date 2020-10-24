import 'package:flutter/material.dart';
import 'package:fresh_news/pages/news_list.dart';
import 'package:fresh_news/services/error_service.dart';
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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => NewsArticleListViewModel(),
          ),
          Provider(
            create: (context) => ErrorService(),
          ),
        ],
        child: NewsList(),
      ),
    );
  }
}
