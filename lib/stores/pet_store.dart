import 'package:animal/models/pets/pet.dart';
import 'package:animal/repository/abstracts/pet_repository_interface.dart';
import 'package:animal/repository/user_repository.dart';
import 'package:animal/stores/state_store.dart';
import 'package:mobx/mobx.dart';

part 'pet_store.g.dart';

class PetStore = _PetStore with _$PetStore;

abstract class _PetStore with Store {
  late IPetRepository _repository;
  late UserRepository _userRepository;

  StateStore petState = StateStore();

  StateStore adoptedState = StateStore();

  _PetStore(this._repository, this._userRepository);

  @observable
  int currentIndex = 0;

  @observable
  List<Pet> pets = [];

  @observable
  List<Pet> allPets = [];

  /*
  @action
  Future<List<Pet>> getAdopted() async {
    adoptedState.state = LoadingState.initial;
    adoptedState.startLoading();
    allPets = await _repository.getAll();
    adoptedState.finishLoading();
    return allPets.where(
      (Pet p) {
        return true;
      },
    ).toList();
  }

  @action
  Future<List<Pet>> getFavorites() async {
    adoptedState.state = LoadingState.initial;
    adoptedState.startLoading();
    allPets = await _repository.getAll();
    adoptedState.finishLoading();
    return allPets.where(
      (Pet p) {
        return true;
      },
    ).toList();
  }
  */

  @action
  Future<void> get() async {
    if (currentIndex == 0) {
      wrapper(_repository.getDogs);
    } else if (currentIndex == 1) {
      wrapper(_repository.getCats);
    } else if (currentIndex == 2) {
      wrapper(_repository.getBirds);
    } else if (currentIndex == 3) {
      wrapper(_repository.getRabbits);
    } else if (currentIndex == 4) {
      wrapper(_repository.getFishes);
    }
  }

  void wrapper(Function func) async {
    petState.state = LoadingState.initial;
    petState.startLoading();
    pets = await func.call();
    petState.finishLoading();
  }
}
