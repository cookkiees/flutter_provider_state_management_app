import '../../domain/entities/article_base_entity.dart';
import 'article_data_models.dart';

class ArticleBaseModels extends ArticleBaseEntity {
  const ArticleBaseModels({
    String? status,
    int? totalResults,
    List<ArticleDataModels>? articles,
  }) : super(status: status, totalResults: totalResults, articles: articles);

  factory ArticleBaseModels.fromJson(Map<String, dynamic> json) {
    return ArticleBaseModels(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: (json['articles'] as List<dynamic>?)
          ?.map((article) => ArticleDataModels.fromJson(article))
          .toList(),
    );
  }
  factory ArticleBaseModels.fromEntity(ArticleBaseEntity entity) {
    return ArticleBaseModels(
      status: entity.status,
      totalResults: entity.totalResults,
      articles:
          entity.articles!.map((e) => ArticleDataModels.fromEntity(e)).toList(),
    );
  }
}
