import 'dart:convert';

Article articleFromJson(String str) => Article.fromJson(json.decode(str));

String articleToJson(Article data) => json.encode(data.toJson());

class Article {
    String author;
    String title;
    String content;
    String createdAt;
    String theme;
    String articleId;

    Article({
        required this.author,
        required this.title,
        required this.content,
        required this.createdAt,
        required this.theme,
        required this.articleId,
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json["author"],
        title: json["title"],
        content: json["content"],
        createdAt: json["created_at"],
        theme: json["theme"],
        articleId: json["article_id"],
    );

    Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "content": content,
        "created_at": createdAt,
        "theme": theme,
        "article_id": articleId,
    };
}
