import 'package:flutter/material.dart';

import '../../../../core/helpers/my_app_logger.dart';
import '../../../../core/services/service_api_result_type.dart';
import '../../data/repository/user_repository_impl.dart';
import '../../domain/entities/user_base_entity.dart';

class UserProvider extends ChangeNotifier {
  UserRepositoryImpl userRepositoryImpl = UserRepositoryImpl();

  final List<UserBaseEntity> _userList = [];

  List<UserBaseEntity> get userList => _userList;

  bool _isLoadingUser = false;

  bool get isLoadingUser => _isLoadingUser;

  Future<void> initaialUser() async {
    _isLoadingUser = true;
    await handleUser();
    notifyListeners();
  }

  Future<void> refreshUser() async {
    _isLoadingUser = true;
    await handleUser();
    notifyListeners();
  }

  Future<void> handleUser() async {
    try {
      final response = await userRepositoryImpl.getUser();
      if (response.result == ApiResultType.success) {
        final data = response.data as List<UserBaseEntity>;
        _userList.clear();
        _userList.addAll(data);
      } else {
        MyAppLogger.logError("${response.message}");
      }
    } catch (e) {
      MyAppLogger.logError("$e");
    } finally {
      _isLoadingUser = false;
    }
  }

  Future<List<UserBaseEntity>> handleUserFuture() async {
    try {
      final response = await userRepositoryImpl.getUser();
      if (response.result == ApiResultType.success) {
        final data = response.data as List<UserBaseEntity>;
        return data;
      } else {
        MyAppLogger.logError("${response.message}");
        return [];
      }
    } catch (e) {
      MyAppLogger.logError("$e");
      return [];
    }
  }
}
