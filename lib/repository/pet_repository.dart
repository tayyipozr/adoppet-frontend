import 'package:animal/models/pets/bird.dart';
import 'package:animal/models/pets/cat.dart';
import 'package:animal/models/pets/dog.dart';
import 'package:animal/models/pets/fish.dart';
import 'package:animal/models/pets/pet.dart';
import 'package:animal/models/pets/rabbit.dart';
import 'package:animal/network/apis/pet_api.dart';
import 'package:animal/repository/abstracts/pet_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PetType {
  NON,
  DOG,
  CAT,
  BIRD,
  RABBIT,
  FISH,
}

class PetRepository implements IPetRepository {
  final SharedPreferences sharedPreferences;
  final PetApi petApi;

  PetRepository({required this.sharedPreferences, required this.petApi});

  @override
  Future<List<Pet>> getDogs() async {
    return petApi.getPets(PetType.DOG.index);
  }

  @override
  Future<List<Pet>> getCats() async {
    return petApi.getPets(PetType.CAT.index);
  }

  @override
  Future<List<Pet>> getBirds() async {
    return petApi.getPets(PetType.BIRD.index);
  }

  @override
  Future<List<Pet>> getRabbits() async {
    return petApi.getPets(PetType.RABBIT.index);
  }

  @override
  Future<List<Pet>> getFishes() async {
    return petApi.getPets(PetType.FISH.index);
  }

  /*
  @override
  Future<List<Pet>> getAll() async {
    return Future.delayed(
      Duration(seconds: 1),
      () => List.from(_cats)
        ..addAll(_dogs)
        ..addAll(_birds)
        ..addAll(_rabbits)
        ..addAll(_fishes),
    );
  }
  */
}
