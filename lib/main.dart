import 'package:flutter/material.dart';
import 'package:fresh_news/pages/news_list_page.dart';
import 'package:fresh_news/viewmodels/news_article_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NewsArticleListViewModel newsArticleList = NewsArticleListViewModel();
    newsArticleList.populateTopHeadlines();
    return MaterialApp(
      title: 'Fresh News',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => newsArticleList,
          ),
        ],
        child: NewsListPage(),
      ),
    );
  }
}
