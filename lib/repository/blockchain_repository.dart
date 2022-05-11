import 'package:animal/network/apis/blockchain_api.dart';
import 'package:animal/repository/base_repository.dart';

class BlockchainRepository extends BaseRepository {
  BlockchainApi _blockchainApi;

  BlockchainRepository(this._blockchainApi);

  Future<void> adoptionTransaction(String content) async {
    try {
      return _blockchainApi.adoptionTransaction(content);
    } catch (err) {
      throw err;
    }
  }
}
