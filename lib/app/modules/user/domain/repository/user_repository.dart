import '../../../../core/services/service_api_result.dart';

abstract class UserRepository {
  Future<ApiResult<List<dynamic>>> getUser();
}
