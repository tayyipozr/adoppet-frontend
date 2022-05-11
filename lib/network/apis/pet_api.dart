import 'package:animal/models/pets/pet.dart';
import 'package:animal/network/base_api.dart';
import 'package:animal/network/endpoints.dart';

class PetApi extends BaseApi {
  Future<List<Pet>> getPets(int typeId) async {
    try {
      print(typeId);
      String url = await endpoint(Endpoints.pets + '/$typeId');

      final response = await dio.get(
        url,
      );

      var pets = response.data.map<Pet>((pet) => Pet.fromJson(pet)).toList();

      print(pets);

      return pets;
    } catch (err) {
      throw err;
    }
  }
}
