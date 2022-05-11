import 'package:animal/core/utils/error_handling_store_mixin.dart';
import 'package:animal/repository/blockchain_repository.dart';
import 'package:animal/stores/state_store.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

part 'blockchain_store.g.dart';

class BlockchainStore = _BlockchainStore with _$BlockchainStore;

abstract class _BlockchainStore with Store, HandleError {
  final BlockchainRepository _blockchainRepository;

  _BlockchainStore(this._blockchainRepository);

  final transactionState = StateStore();

  Future<void> adoptionTransaction(String content) async {
    transactionState.resetLoading();
    try {
      transactionState.startLoading();
      await _blockchainRepository.adoptionTransaction(content);
      transactionState.finishLoading();
    } on DioError catch (error) {
      handleStoreError(transactionState, error);
    }
  }
}
