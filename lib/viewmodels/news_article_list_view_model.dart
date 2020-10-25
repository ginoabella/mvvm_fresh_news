import 'package:flutter/foundation.dart';
import 'package:fresh_news/models/news_article.dart';
import 'package:fresh_news/services/error_service.dart';
import 'package:fresh_news/services/web_service.dart';
import 'package:fresh_news/viewmodels/news_article_view_model.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListViewModel extends ChangeNotifier {
  LoadingStatus status = LoadingStatus.searching;

  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  Future<void> search(String keyword) async {
    this.status = LoadingStatus.searching;
    notifyListeners();

    List<NewsArticle> newsArticles = await WebService()
        .fetchHeadlinesByKeyword(keyword)
        .catchError((_) => ErrorService.setError());

    if (!ErrorService.getError()) {
      this.articles = newsArticles
          .map((article) => NewsArticleViewModel(article: article))
          .toList();

      this.status =
          this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
      notifyListeners();
    }
  }

  Future<void> populateTopHeadlines() async {
    this.status = LoadingStatus.searching;
    notifyListeners();

    List<NewsArticle> newsArticles = await WebService()
        .fetchTopHeadlines()
        .catchError((_) => ErrorService.setError());

    if (!ErrorService.getError()) {
      this.articles = newsArticles
          .map((article) => NewsArticleViewModel(article: article))
          .toList();

      this.status =
          this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
      notifyListeners();
    }
  }
}
