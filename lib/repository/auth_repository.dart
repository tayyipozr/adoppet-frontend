import 'package:animal/constants/preferences_constants.dart';
import 'package:animal/models/auth/auth.dart';
import 'package:animal/models/auth/token.dart';
import 'package:animal/network/apis/auth_api.dart';
import 'package:animal/repository/base_repository.dart';

class AuthRepository extends BaseRepository {
  AuthApi _authApi;

  AuthRepository(this._authApi);

  Future<Token> signup(Auth auth) async {
    try {
      Token token = await _authApi.signup(auth);
      sharedPreferences.setString(PreferencesConstants.TOKEN, token.access_token);
      return token;
    } catch (err) {
      throw err;
    }
  }

  Future<Token> signin(Auth auth) async {
    try {
      Token token = await _authApi.signin(auth);
      sharedPreferences.setString(PreferencesConstants.TOKEN, token.access_token);
      return token;
    } catch (err) {
      throw err;
    }
  }
}
