import 'package:animal/core/utils/error_handling_store_mixin.dart';
import 'package:animal/models/adopt/adoption_payload.dart';
import 'package:animal/repository/notification_repository.dart';
import 'package:animal/stores/state_store.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

part 'notification_store.g.dart';

class NotificationStore = _NotificationStore with _$NotificationStore;

abstract class _NotificationStore with Store, HandleError {
  final NotificationRepository _notificationRepository;

  _NotificationStore(this._notificationRepository);

  final initializeTokenState = StateStore();

  final sendNotificationState = StateStore();

  Future<void> initializeToken(String? token) async {
    initializeTokenState.resetLoading();
    try {
      initializeTokenState.startLoading();
      await _notificationRepository.initializeToken(token);
      initializeTokenState.finishLoading();
    } on DioError catch (error) {
      handleStoreError(initializeTokenState, error);
    }
  }

  Future<void> sendNotification(int petId, AdoptionPayload payload) async {
    sendNotificationState.resetLoading();
    try {
      sendNotificationState.startLoading();
      await _notificationRepository.sendNotification(petId, payload);
      sendNotificationState.finishLoading();
    } on DioError catch (error) {
      handleStoreError(sendNotificationState, error);
    }
  }
}
