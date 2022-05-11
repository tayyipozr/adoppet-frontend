import 'package:animal/stores/adopt_store.dart';
import 'package:animal/stores/auth_store.dart';
import 'package:animal/stores/blockchain_store.dart';
import 'package:animal/stores/core_store.dart';
import 'package:animal/stores/notification_store.dart';
import 'package:animal/stores/pet_store.dart';
import 'package:animal/stores/user_store.dart';
import 'package:mobx/mobx.dart';

part 'root_store.g.dart';

class RootStore = _RootStore with _$RootStore;

abstract class _RootStore with Store {
  _RootStore({
    required this.authStore,
    required this.coreStore,
    required this.userStore,
    required this.petStore,
    required this.notificationStore,
    required this.adoptStore,
    required this.blockchainStore,
  });

  @observable
  late CoreStore coreStore;

  @observable
  late PetStore petStore;

  @observable
  late AuthStore authStore;

  @observable
  late UserStore userStore;

  @observable
  late NotificationStore notificationStore;

  @observable
  late AdoptStore adoptStore;

  @observable
  late BlockchainStore blockchainStore;
}
