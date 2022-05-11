import 'package:animal/network/apis/adopt_api.dart';
import 'package:animal/models/adopt/adoption.dart';
import 'package:animal/repository/base_repository.dart';

class AdoptRepository extends BaseRepository {
  AdoptApi _adoptApi;

  AdoptRepository(this._adoptApi);

  Future<bool> adopt(int petId) async {
    try {
      return _adoptApi.adopt(petId);
    } catch (err) {
      throw err;
    }
  }

   Future<List<Adoption>> getAdoptionRequests() async {
    try {
      return _adoptApi.getAdoptionRequests();
    } catch (err) {
      throw err;
    }
  }

  
  Future<Adoption> updateProcess(int adoptId, int processId) async {
     try {
      return _adoptApi.updateProcess(adoptId, processId);
    } catch (err) {
      throw err;
    }
  }

  
   Future<List<Adoption>> getApplications() async {
    try {
      return _adoptApi.getApplications();
    } catch (err) {
      throw err;
    }
  }

}
