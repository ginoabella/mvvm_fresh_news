import 'package:fresh_news/utils/constan_key.dart';

class Constants {
  static String TOP_HEADLINES_URL =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$kApiKey';

  static String headlinesFor(String keyword) {
    return 'https://newsapi.org/v2/everything?q=$keyword&apiKey=$kApiKey';
  }
}
