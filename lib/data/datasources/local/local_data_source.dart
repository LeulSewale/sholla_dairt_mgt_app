import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../../core/constants/app_constants.dart';
import '../../models/user_model.dart';

abstract class LocalDataSource {
  Future<void> cacheUserData(UserModel user);
  Future<UserModel?> getCachedUserData();
  Future<void> clearUserData();
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheUserData(UserModel user) async {
    await sharedPreferences.setString(
      AppConstants.userDataKey,
      json.encode(user.toJson()),
    );
  }

  @override
  Future<UserModel?> getCachedUserData() async {
    final userData = sharedPreferences.getString(AppConstants.userDataKey);
    if (userData != null) {
      return UserModel.fromJson(json.decode(userData));
    }
    return null;
  }

  @override
  Future<void> clearUserData() async {
    await sharedPreferences.remove(AppConstants.userDataKey);
    await sharedPreferences.remove(AppConstants.userTokenKey);
  }
}
