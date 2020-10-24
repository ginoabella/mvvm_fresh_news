import 'package:flutter/foundation.dart';
import 'package:fresh_news/models/news_article.dart';
import 'package:fresh_news/services/web_service.dart';
import 'package:fresh_news/viewmodels/news_article_view_model.dart';

class NewsArticleListViewModel extends ChangeNotifier {
  bool _error = false;
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  NewsArticleListViewModel() {
    _populateTopHeadlines();
  }

  Future<void> _populateTopHeadlines() async {
    List<NewsArticle> newsArticles =
        await WebService().fetchTopHeadlines().catchError((_) {
      _error = true;
      print('Error and _error = $_error');
    });
    if (!_error) {
      this.articles = newsArticles
          .map((article) => NewsArticleViewModel(article: article))
          .toList();

      notifyListeners();
    }
  }
}
