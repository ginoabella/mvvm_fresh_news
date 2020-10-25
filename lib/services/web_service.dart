import 'dart:convert';
//import 'dart:io';

import 'package:fresh_news/models/news_article.dart';
import 'package:fresh_news/utils/constants.dart';
import 'package:http/http.dart' show Client;

// import 'package:http/http.dart' as http;

// class WebService {
//   Future<List<NewsArticle>> fetchTopHeadlines() async {
//     String url =
//         'https://newsapi.org/v2/top-headlines?country=us&apiKey=c0231592033f40ddbc46f568794f1a19';

//     try {
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final result = json.decode(response.body);
//         Iterable list = result['article'];
//         return list.map((article) => NewsArticle.fromJSON(article)).toList();
//       } else {
//         throw Exception('Failed to get top headlines');
//       }
//     } on SocketException {
//       throw ConnectionException();
//     }
//   }
// }

// abstract class ApiException implements Exception {}

// class EmptyResultException extends ApiException {}

// class ConnectionException extends ApiException {}

// class ServerErrorException extends ApiException {}

// class ClientErrorException extends ApiException {}

// class UnknownException extends ApiException {}

const String kApiKey = 'c0231592033f40ddbc46f568794f1a19';

class WebService {
  Client client = Client();

  Future<List<NewsArticle>> fetchHeadlinesByKeyword(String keyword) async {
    try {
      final response = await client.get(Constants.headlinesFor(keyword));
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        final Iterable list = result['articles'] as List;
        return list
            .map((article) =>
                NewsArticle.fromJSON(article as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to get queried headlines');
      }
    } catch (e) {
      throw Exception('Failed get');
    }
  }

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    try {
      final response = await client.get(Constants.TOP_HEADLINES_URL);
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        final Iterable list = result['articles'] as List;
        return list
            .map((article) =>
                NewsArticle.fromJSON(article as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to get top headlines');
      }
    } catch (e) {
      throw Exception('Failed get');
    }
  }
}
