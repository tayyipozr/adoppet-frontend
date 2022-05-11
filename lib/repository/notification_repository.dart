import 'package:animal/models/adopt/adoption_payload.dart';
import 'package:animal/network/apis/notification_api.dart';
import 'package:animal/repository/base_repository.dart';

class NotificationRepository extends BaseRepository {
  NotificationApi _notificationApi;

  NotificationRepository(this._notificationApi);

  Future<void> initializeToken(String? token) async {
    try {
      _notificationApi.initializeToken(token);
    } catch (err) {
      throw err;
    }
  }

  Future<void> sendNotification(int petId, AdoptionPayload payload) async {
    try {
      _notificationApi.sendNotification(petId, payload);
    } catch (err) {
      throw err;
    }
  }
}
