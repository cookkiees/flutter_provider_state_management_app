import '../../../../core/constants/constants.dart';
import '../../../../core/services/service_api_request.dart';
import '../models/article_base_models.dart';

class ArticleApiRequest extends ApiRequest<ArticleBaseModels> {
  final String? q;
  final String? sortBy;

  ArticleApiRequest({this.sortBy, this.q});

  @override
  ArticleBaseModels Function(dynamic) get decoder => (dynamic data) {
        final Map<String, dynamic> json = data;
        final article = ArticleBaseModels.fromJson(json);
        return article;
      };

  @override
  Map<String, String>? get headers => {};

  @override
  String get method => 'GET';

  @override
  Map<String, dynamic>? get params => {
        'q': q,
        'sortBy': sortBy,
        'apikey': articleaAPIKey,
      };

  @override
  String get path => 'everything';
}
