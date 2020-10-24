import 'package:flutter/material.dart';
import 'package:fresh_news/services/error_service.dart';
import 'package:fresh_news/viewmodels/news_article_list_view_model.dart';
import 'package:provider/provider.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NewsArticleListViewModel vm =
        Provider.of<NewsArticleListViewModel>(context);
    //final ErrorService er = Provider.of<ErrorService>(context, listen: false);
    final error = ErrorService.getError();
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: error
          ? Center(child: Text('Error'))
          : ListView.builder(
              itemCount: vm.articles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(vm.articles[index].title),
                );
              },
            ),
    );
  }
}
