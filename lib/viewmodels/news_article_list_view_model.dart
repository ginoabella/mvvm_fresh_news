import 'package:flutter/foundation.dart';
import 'package:fresh_news/models/news_article.dart';
import 'package:fresh_news/services/error_service.dart';
import 'package:fresh_news/services/web_service.dart';
import 'package:fresh_news/viewmodels/news_article_view_model.dart';

class NewsArticleListViewModel extends ChangeNotifier {
  //bool _error = ErrorService.getError(reset: true);
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  NewsArticleListViewModel() {
    _populateTopHeadlines();
  }

  Future<void> _populateTopHeadlines() async {
    List<NewsArticle> newsArticles = await WebService()
        .fetchTopHeadlines()
        .catchError((_) => ErrorService.setError());
    // ignore: todo
    // TODO: Create error handler and place in provider so that its accessible to the UI.
    if (!ErrorService.getError()) {
      this.articles = newsArticles
          .map((article) => NewsArticleViewModel(article: article))
          .toList();

      notifyListeners();
    }
  }
}
