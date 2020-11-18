class NewsModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  NewsModel(this.author, this.title, this.description, this.url,
      this.urlToImage, this.publishedAt, this.content);

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
      json["author"],
      json["title"],
      json["description"],
      json["url"],
      json["urlToImage"],
      json["publishedAt"],
      json["content"]);
}
