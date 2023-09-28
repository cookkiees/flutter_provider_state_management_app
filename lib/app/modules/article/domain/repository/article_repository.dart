import '../../../../core/services/service_api_result.dart';
import '../../data/models/article_base_models.dart';

abstract class ArticleRepository {
  Future<ApiResult<ArticleBaseModels>> getArticle(String? sortBy, String? q);
}
