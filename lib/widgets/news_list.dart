import 'package:flutter/material.dart';
import 'package:fresh_news/viewmodels/news_article_view_model.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    Key key,
    @required this.articles,
  }) : super(key: key);

  final List<NewsArticleViewModel> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ListTile(
          leading: SizedBox(
            width: 100,
            height: 100,
            child: article.urlToImage == null
                ? Image.asset('images/news-placeholder.png')
                : Image.network(article.urlToImage),
          ),
          title: Text(article.title),
        );
      },
    );
  }
}
