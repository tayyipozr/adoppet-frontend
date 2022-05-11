import 'package:animal/models/adopt/adoption_payload.dart';
import 'package:animal/network/base_api.dart';
import 'package:animal/network/endpoints.dart';

class NotificationApi extends BaseApi {
  Future<void> initializeToken(String? token) async {
    try {
      String url = await endpoint(Endpoints.notifications);

      final response = await dio.patch(
        url,
        data: {
          'token': token,
        },
      );

      print(response);
    } catch (err) {
      throw err;
    }
  }

  Future<void> sendNotification(int petId, AdoptionPayload payload) async {
    try {
      String url = await endpoint(Endpoints.notifications + '/$petId');

      final response = await dio.post(
        url,
        data: payload.toJson(),
      );

      print(response);
    } catch (err) {
      throw err;
    }
  }
}
