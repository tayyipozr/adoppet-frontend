import 'package:animal/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final SharedPreferences sharedPreferences;

  UserRepository({required this.sharedPreferences});

  User user = User(
    id: 1,
    age: 20,
    name: "Tayyip",
    surname: "ÖZER",
    sex: false,
    imageUrls: ["https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png"],
    favorites: [1, 4, 17, 22],
    adopted: [3, 11, 23],
  );
}
