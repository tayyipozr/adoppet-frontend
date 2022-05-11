import 'package:animal/core/utils/error_handling_store_mixin.dart';
import 'package:animal/models/adopt/adoption.dart';
import 'package:animal/models/pets/pet.dart';
import 'package:animal/repository/adopt_repository.dart';
import 'package:animal/stores/state_store.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

part 'adopt_store.g.dart';

class AdoptStore = _AdoptStore with _$AdoptStore;

abstract class _AdoptStore with Store, HandleError {
  final AdoptRepository _adoptRepository;
  _AdoptStore(this._adoptRepository);

  @observable
  List<Adoption> adoptionRequests = [];

  @observable
  List<Adoption> applications = [];

  @observable
  List<Adoption> adoptions = [];

  Future<bool> isSuccess = Future.value(false);

  final adoptState = StateStore();

  final requestsState = StateStore();

  final applicationsState = StateStore();

  Future<bool> adopt(int petId) async {
    adoptState.resetLoading();
    try {
      adoptState.startLoading();
      isSuccess = _adoptRepository.adopt(petId);
      adoptState.finishLoading();
    } on DioError catch (error) {
      handleStoreError(adoptState, error);
    }

    return isSuccess;
  }

  Future<void> getAdoptionRequests() async {
    requestsState.resetLoading();
    try {
      requestsState.startLoading();
      adoptionRequests = await _adoptRepository.getAdoptionRequests();
      requestsState.finishLoading();
    } on DioError catch (error) {
      handleStoreError(requestsState, error);
    }
  }

  Future<void> updateAdoption(int adoptId, int processId) async {
    requestsState.resetLoading();
    try {
      requestsState.startLoading();
      var adopt = await _adoptRepository.updateProcess(adoptId, processId);
      var replaced = adoptionRequests.firstWhere((element) => element.id == adoptId);
      adoptionRequests.remove(replaced);
      replaced = replaced.copyWith(
        updatedAt: adopt.updatedAt,
        adoptionProcess: adopt.adoptionProcess,
        adoptionProcessId: adopt.adoptionProcessId,
      );
      print(replaced.adoptionProcess!.status);
      print(adopt.adoptionProcess!.status);
      adoptionRequests.add(replaced);
      adoptionRequests = adoptionRequests;
      requestsState.finishLoading();
    } on DioError catch (error) {
      handleStoreError(requestsState, error);
    }
  }

  Future<void> getApplications() async {
    applicationsState.resetLoading();
    try {
      applicationsState.startLoading();
      applications = await _adoptRepository.getApplications();
      applicationsState.finishLoading();
    } on DioError catch (error) {
      handleStoreError(applicationsState, error);
    }
  }
}
