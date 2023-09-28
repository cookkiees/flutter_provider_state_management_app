import '../../../../core/services/service_api.dart';
import '../../../../core/services/service_api_result.dart';
import '../../domain/repository/article_repository.dart';
import '../models/article_base_models.dart';
import '../sources/article_api_request.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<ApiResult<ArticleBaseModels>> getArticle(
      String? sortBy, String? q) async {
    ArticleApiRequest request = ArticleApiRequest(sortBy: sortBy, q: q);
    final response = await ApiService.instance.request(
      request,
      articleApi: true,
    );
    return response;
  }
}
