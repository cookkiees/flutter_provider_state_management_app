import '../../domain/entities/article_source_entity.dart';

class ArticleSourceModels extends ArticleSourceEntity {
  const ArticleSourceModels({
    String? id,
    String? name,
  }) : super(id: id, name: name);

  factory ArticleSourceModels.fromJson(Map<String, dynamic> json) {
    return ArticleSourceModels(
      id: json['id'],
      name: json['name'],
    );
  }
  factory ArticleSourceModels.fromEntity(ArticleSourceEntity entity) {
    return ArticleSourceModels(
      id: entity.id,
      name: entity.name,
    );
  }
}
