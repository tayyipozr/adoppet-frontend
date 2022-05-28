import 'dart:convert';

import 'package:animal/models/adopt/adoption.dart';
import 'package:animal/network/base_api.dart';
import 'package:animal/network/endpoints.dart';

class AdoptApi extends BaseApi {
  Future<bool> adopt(int petId) async {
    try {
      String url = await endpoint(Endpoints.adopts + '/$petId');

      final response = await dio.post(
        url,
      );

      return jsonDecode(response.data);
    } catch (err) {
      throw err;
    }
  }

  Future<List<Adoption>> getAdoptionRequests() async {
    try {
      String url = await endpoint(Endpoints.adopts);

      final response = await dio.get(
        url,
      );

      var adoptionsRequests = response.data.map<Adoption>((adopt) => Adoption.fromJson(adopt)).toList();

      return adoptionsRequests;
    } catch (err) {
      throw err;
    }
  }

  Future<Adoption> updateProcess(int adoptId, int processId) async {
    try {
      String url = await endpoint(Endpoints.adopts + '/$adoptId/$processId');

      final response = await dio.patch(
        url,
      );

      return Adoption.fromJson(response.data);
    } catch (err) {
      throw err;
    }
  }

  Future<List<Adoption>> getApplications() async {
    try {
      String url = await endpoint(Endpoints.applications);

      final response = await dio.get(
        url,
      );

      var adoptionsRequests = response.data.map<Adoption>((adopt) => Adoption.fromJson(adopt)).toList();

      print(adoptionsRequests);

      return adoptionsRequests;
    } catch (err) {
      throw err;
    }
  }
}
