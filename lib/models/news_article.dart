class NewsArticle {
  final String title;
  final String description;
  final String urlToImage;
  final String url;

  NewsArticle({
    this.title,
    this.description,
    this.urlToImage,
    this.url,
  });

  factory NewsArticle.fromJSON(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] as String,
      description: json['description'] as String,
      urlToImage: json['urlToImage'] as String,
      url: json['url'] as String,
    );
  }
}
