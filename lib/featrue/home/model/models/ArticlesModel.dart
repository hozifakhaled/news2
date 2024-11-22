class ArticleModel {
  
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

 ArticleModel(
      {
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  ArticleModel.fromJson(Map<String, dynamic> json) {
   
    author = json['author']?? 'Unknown Author';
    title = json['title'] ?? 'Unknown Author';
    description = json['description']?? 'Unknown Author';
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt']?? 'Unknown Author';
    content = json['content']?? 'Unknown Author';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    
    
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }
}