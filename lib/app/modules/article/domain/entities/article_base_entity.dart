import 'package:equatable/equatable.dart';
import 'article_data_entity.dart';

class ArticleBaseEntity extends Equatable {
  final String? status;
  final int? totalResults;
  final List<ArticleDataEntity>? articles;

  const ArticleBaseEntity({this.status, this.totalResults, this.articles});

  @override
  List<Object?> get props => [status, totalResults, articles];
}
