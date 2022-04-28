import 'package:animal/models/auth/auth.dart';
import 'package:animal/models/auth/token.dart';
import 'package:animal/network/base_api.dart';
import 'package:animal/network/endpoints.dart';

class AuthApi extends BaseApi {
  Future<Token> signup(Auth auth) async {
    try {
      String url = await endpoint(Endpoints.signup);

      final response = await dio.post(
        url,
        data: auth.toJson(),
      );

      return Token.fromJson(response.data);
    } catch (err) {
      throw err;
    }
  }

  Future<Token> signin(Auth auth) async {
    try {
      String url = await endpoint(Endpoints.signin);

      final response = await dio.post(
        url,
        data: auth.toJson(),
      );

      return Token.fromJson(response.data);
    } catch (err) {
      throw err;
    }
  }
}
