import 'dart:convert';
//import 'dart:io';

import 'package:fresh_news/models/news_article.dart';
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

class WebService {
  Client client = Client();

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=c0231592033f40ddbc46f568794f1a19';

    try {
      final response = await client.get(url);
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        Iterable list = result['articles'];
        return list.map((article) => NewsArticle.fromJSON(article)).toList();
      } else {
        throw Exception('Failed to get top headlines');
      }
    } catch (e) {
      throw Exception('Failed get');
    }
  }
}
