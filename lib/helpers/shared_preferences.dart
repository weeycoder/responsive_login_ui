import 'package:login_signin_ui/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static late SharedPreferences _preferences;

  static const String _loggedUserKey = 'loggedUser';
  static const String _errorMsgKey = 'errorMsg';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  /// Authentication
  static Future setLoggedUser(UserModel user) async {
    final String userJson = userModelToJson(user);
    await _preferences.setString(_loggedUserKey, userJson);
  }

  static UserModel getLoggedUser() {
    final String? userJson = _preferences.getString(_loggedUserKey);
    if (userJson != null) {
      return userModelFromJson(userJson);
    }
    return UserModel();
  }

  static Future setErrorMsg(String errorMsg) async =>
      await _preferences.setString(_errorMsgKey, errorMsg);

  static String getErrorMsg() =>
      _preferences.getString(_errorMsgKey) ?? 'Something went wrong...';

  static Future<void> clearSharedPreference() => _preferences.clear();
}
