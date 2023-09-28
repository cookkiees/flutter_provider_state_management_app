import '../../../../core/services/service_api_result.dart';
import '../../../../core/services/service_api.dart';
import '../../domain/repository/user_repository.dart';
import '../sources/user_api_request.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<ApiResult<List<dynamic>>> getUser() async {
    UserApiRequest request = UserApiRequest();
    final response = await ApiService.instance.request(request);
    return response;
  }
}
