import '../../domain/entities/article_data_entity.dart';
import 'article_source_models.dart';

class ArticleDataModels extends ArticleDataEntity {
  const ArticleDataModels({
    ArticleSourceModels? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
          source: source,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory ArticleDataModels.fromJson(Map<String, dynamic> json) {
    return ArticleDataModels(
      source: json['source'] != null
          ? ArticleSourceModels.fromJson(json['source'])
          : null,
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
  factory ArticleDataModels.fromEntity(ArticleDataEntity entity) {
    return ArticleDataModels(
      source: entity.source != null
          ? ArticleSourceModels.fromEntity(entity.source!)
          : null,
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.publishedAt,
      content: entity.content,
    );
  }
}
