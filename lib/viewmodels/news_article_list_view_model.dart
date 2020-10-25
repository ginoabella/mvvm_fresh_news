import 'package:flutter/foundation.dart';
import 'package:fresh_news/models/news_article.dart';
import 'package:fresh_news/services/error_service.dart';
import 'package:fresh_news/services/web_service.dart';
import 'package:fresh_news/viewmodels/news_article_view_model.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListViewModel extends ChangeNotifier {
  LoadingStatus status = LoadingStatus.searching;

  List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];

  Future<void> search(String keyword) async {
    status = LoadingStatus.searching;
    notifyListeners();

    final List<NewsArticle> newsArticles = await WebService()
        .fetchHeadlinesByKeyword(keyword)
        .catchError((_) => ErrorService.setError());

    if (!ErrorService.getError()) {
      articles = newsArticles
          .map((article) => NewsArticleViewModel(article: article))
          .toList();

      status = articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
      notifyListeners();
    }
  }

  Future<void> populateTopHeadlines() async {
    status = LoadingStatus.searching;
    notifyListeners();

    final List<NewsArticle> newsArticles = await WebService()
        .fetchTopHeadlines()
        .catchError((_) => ErrorService.setError());

    if (!ErrorService.getError()) {
      articles = newsArticles
          .map((article) => NewsArticleViewModel(article: article))
          .toList();

      status = articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
      notifyListeners();
    }
  }
}
