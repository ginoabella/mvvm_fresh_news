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
      title: json['title'].toString(),
      description: json['description'].toString(),
      urlToImage: json['urlToImage'].toString(),
      url: json['url'].toString(),
    );
  }
}
