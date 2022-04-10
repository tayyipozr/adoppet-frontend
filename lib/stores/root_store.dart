import 'package:animal/stores/auth_store.dart';
import 'package:animal/stores/core_store.dart';
import 'package:animal/stores/pet_store.dart';
import 'package:mobx/mobx.dart';

part 'root_store.g.dart';

class RootStore = _RootStore with _$RootStore;

abstract class _RootStore with Store {
  _RootStore({required this.authStore, required this.coreStore, required this.petStore});

  @observable
  late CoreStore coreStore;

  @observable
  late PetStore petStore;

  @observable
  late AuthStore authStore;
}
