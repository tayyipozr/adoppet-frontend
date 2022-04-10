import 'package:animal/models/pets/bird.dart';
import 'package:animal/models/pets/cat.dart';
import 'package:animal/models/pets/dog.dart';
import 'package:animal/models/pets/fish.dart';
import 'package:animal/models/pets/pet.dart';
import 'package:animal/models/pets/rabbit.dart';

abstract class IPetRepository {
  Future<List<Pet>> getAll();
  Future<List<Cat>> getCats();
  Future<List<Dog>> getDogs();
  Future<List<Bird>> getBirds();
  Future<List<Rabbit>> getRabbits();
  Future<List<Fish>> getFishes();
}
