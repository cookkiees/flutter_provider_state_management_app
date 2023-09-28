import '../../../../core/services/service_api_request.dart';
import '../models/user_base_models.dart';

class UserApiRequest extends ApiRequest<List<UserBaseModels>> {
  @override
  List<UserBaseModels> Function(dynamic) get decoder => (dynamic data) {
        final List<dynamic> userList = data as List<dynamic>;
        final List<UserBaseModels> userModelsList = userList
            .map((userData) => UserBaseModels.fromJson(userData))
            .toList();
        return userModelsList;
      };
  @override
  Map<String, String>? get headers => {};

  @override
  String get method => 'GET';

  @override
  Map<String, dynamic>? get params => {};

  @override
  String get path => 'users';
}
