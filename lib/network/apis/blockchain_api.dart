import 'package:animal/network/base_api.dart';
import 'package:animal/network/endpoints.dart';

class BlockchainApi extends BaseApi {
  Future<void> adoptionTransaction(String content) async {
    try {
      String url = await endpoint(Endpoints.blockchain);

      final response = await dio.post(
        url,
        data: {
          'content': content,
        },
      );

      print(response);
    } catch (err) {
      throw err;
    }
  }
}
