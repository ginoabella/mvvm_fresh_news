import 'package:flutter/material.dart';
import 'package:fresh_news/services/error_service.dart';
import 'package:fresh_news/viewmodels/news_article_list_view_model.dart';
import 'package:fresh_news/widgets/news_list.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  final _controller = TextEditingController();

  Widget _buildList(NewsArticleListViewModel vm) {
    switch (vm.status) {
      case LoadingStatus.searching:
        return const Align(child: CircularProgressIndicator());

      case LoadingStatus.empty:
        return const Align(child: Text('No Result Found'));

      case LoadingStatus.completed:
        return Expanded(
          child: NewsList(articles: vm.articles),
        );
    }
    return const Text(
        'Not supposed to reach this'); // just so no errors to display
  }

  @override
  Widget build(BuildContext context) {
    final NewsArticleListViewModel vm =
        Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top News'),
      ),
      body: ErrorService.getError()
          ? const Center(child: Text('Error'))
          : Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'Enter Search',
                    icon: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.search),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        vm.populateTopHeadlines();
                        _controller.clear();
                      },
                    ),
                  ),
                  onSubmitted: (value) {
                    // fetch all news related to the keyword
                    if (value.isNotEmpty) {
                      vm.search(value);
                    }
                  },
                ),
                _buildList(vm),
              ],
            ),
    );
  }
}
