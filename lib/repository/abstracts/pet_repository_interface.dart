import 'package:animal/models/pets/pet.dart';

abstract class IPetRepository {
  // Future<List<Pet>> getAll();
  Future<List<Pet>> getCats();
  Future<List<Pet>> getDogs();
  Future<List<Pet>> getBirds();
  Future<List<Pet>> getRabbits();
  Future<List<Pet>> getFishes();
}
