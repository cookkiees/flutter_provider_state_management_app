import 'package:flutter/material.dart';

import '../../../../core/helpers/my_app_logger.dart';
import '../../../../core/services/service_api_result_type.dart';
import '../../data/repository/article_repository_impl.dart';
import '../../domain/entities/article_data_entity.dart';

class ArticleProvider extends ChangeNotifier {
  ArticleRepositoryImpl articleRepositoryImpl = ArticleRepositoryImpl();

  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;

  void onExpanded() {
    _isExpanded = !_isExpanded;
  }

  Query _selectedQuery = Query.apple;
  SortBy _selectedSortBy = SortBy.popularity;

  Query get selectedQuery => _selectedQuery;
  SortBy get selectedSortBy => _selectedSortBy;

  set onSelectedQuery(Query query) {
    _selectedQuery = query;
    notifyListeners();
  }

  set onSelectedSortBy(SortBy query) {
    _selectedSortBy = query;
    notifyListeners();
  }

  Future<List<ArticleDataEntity>> handleArticleFuture(sortBy, q) async {
    try {
      final response = await articleRepositoryImpl.getArticle(sortBy, q);
      if (response.result == ApiResultType.success) {
        return response.data?.articles as List<ArticleDataEntity>;
      } else {
        MyAppLogger.logError(response.message.toString());
        return [];
      }
    } catch (e) {
      MyAppLogger.logError(e.toString());
      return [];
    }
  }
}

enum SortBy { popularity, publishedAt }

enum Query { apple, tesla }

extension SortByName on SortBy {
  String get name {
    switch (this) {
      case SortBy.popularity:
        return 'popularity';
      case SortBy.publishedAt:
        return 'publishedAt';
      default:
        throw Exception('Invalid SortBy value');
    }
  }
}

extension QueryByName on Query {
  String get name {
    switch (this) {
      case Query.apple:
        return 'apple';
      case Query.tesla:
        return 'tesla';
      default:
        throw Exception('Invalid SortBy value');
    }
  }
}
