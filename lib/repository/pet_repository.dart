import 'package:animal/models/pets/bird.dart';
import 'package:animal/models/pets/cat.dart';
import 'package:animal/models/pets/dog.dart';
import 'package:animal/models/pets/fish.dart';
import 'package:animal/models/pets/pet.dart';
import 'package:animal/models/pets/rabbit.dart';
import 'package:animal/repository/abstracts/pet_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetRepository implements IPetRepository {
  final SharedPreferences sharedPreferences;

  PetRepository({required this.sharedPreferences});

  List<Dog> _dogs = [
    Dog(
      id: 1,
      name: "Taylor",
      age: 2,
      category: "Dog",
      color: "Green",
      height: 50,
      imageUrls: [
        "https://images.unsplash.com/photo-1583337130417-3346a1be7dee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80"
      ],
      sex: false,
      weight: 30,
    ),
    Dog(
      id: 2,
      name: "Berisha",
      age: 3,
      category: "Köpek",
      color: "Sarı",
      height: 20,
      imageUrls: [
        "https://images.unsplash.com/photo-1583511655826-05700d52f4d9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=688&q=80",
      ],
      sex: true,
      weight: 10,
    ),
    Dog(
      id: 3,
      name: "Osai",
      age: 6,
      category: "Dog",
      color: "Pink",
      height: 70,
      imageUrls: [
        "https://images.unsplash.com/photo-1504595403659-9088ce801e29?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80",
      ],
      sex: false,
      weight: 40,
    ),
    Dog(
      id: 4,
      name: "Ferdi",
      age: 5,
      category: "Dog",
      color: "Black",
      height: 60,
      imageUrls: [
        "https://images.unsplash.com/photo-1592754862816-1a21a4ea2281?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80",
      ],
      sex: true,
      weight: 25,
    ),
    Dog(
      id: 5,
      name: "Valencia",
      age: 1,
      category: "Dog",
      color: "Green",
      height: 40,
      imageUrls: [
        "https://images.unsplash.com/photo-1609791636587-50feca5caee7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80"
      ],
      sex: true,
      weight: 10,
    ),
  ];

  List<Cat> _cats = [
    Cat(
      id: 6,
      name: "Taylor",
      age: 2,
      category: "Dog",
      color: "Green",
      height: 50,
      imageUrls: [
        "https://images.unsplash.com/photo-1501820488136-72669149e0d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
      ],
      sex: false,
      weight: 30,
    ),
    Cat(
      id: 7,
      name: "Berisha",
      age: 3,
      category: "Cat",
      color: "Purple",
      height: 20,
      imageUrls: [
        "https://images.unsplash.com/photo-1555685812-4b943f1cb0eb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2940&q=80",
      ],
      sex: true,
      weight: 10,
    ),
    Cat(
      id: 8,
      name: "Osai",
      age: 6,
      category: "Cat",
      color: "Pink",
      height: 70,
      imageUrls: [
        "https://images.unsplash.com/photo-1541781774459-bb2af2f05b55?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1460&q=80",
      ],
      sex: false,
      weight: 40,
    ),
    Cat(
      id: 9,
      name: "Ferdi",
      age: 5,
      category: "Cat",
      color: "Black",
      height: 60,
      imageUrls: [
        "https://images.unsplash.com/photo-1548366086-7f1b76106622?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=676&q=80",
      ],
      sex: true,
      weight: 25,
    ),
    Cat(
      id: 10,
      name: "Valencia",
      age: 1,
      category: "Cat",
      color: "Green",
      height: 40,
      imageUrls: [
        "https://images.unsplash.com/photo-1518288774672-b94e808873ff?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=876&q=80"
      ],
      sex: true,
      weight: 10,
    ),
  ];

  List<Bird> _birds = [
    Bird(
      id: 11,
      name: "Taylor",
      age: 2,
      category: "Bird",
      color: "Green",
      height: 50,
      imageUrls: [
        "https://cdn.pixabay.com/photo/2019/08/03/18/24/bird-4382321_1280.jpg",
      ],
      sex: false,
      weight: 30,
    ),
    Bird(
      id: 12,
      name: "Berisha",
      age: 3,
      category: "Bird",
      color: "Purple",
      height: 20,
      imageUrls: [
        "http://www.elitephotoart.com/gallery/photographers/larry_daniel/BD-LD-0013.jpg",
      ],
      sex: true,
      weight: 10,
    ),
    Bird(
      id: 13,
      name: "Osai",
      age: 6,
      category: "Bird",
      color: "Pink",
      height: 70,
      imageUrls: [
        "https://lh3.googleusercontent.com/proxy/qSafwYQplT9SpCdoML3EXiT43Xwj2Aq0SQdIN6tBV-i6lnmX2WPExuTdXuPQsOKWv4Xireln0RrB_IcFwu1i5LGr_llf",
      ],
      sex: false,
      weight: 40,
    ),
    Bird(
      id: 14,
      name: "Ferdi",
      age: 5,
      category: "Bird",
      color: "Black",
      height: 60,
      imageUrls: [
        "http://htc-wallpaper.com/wp-content/uploads/2013/11/bird1.jpg",
      ],
      sex: true,
      weight: 25,
    ),
    Bird(
      id: 15,
      name: "Valencia",
      age: 1,
      category: "Bird",
      color: "Green",
      height: 40,
      imageUrls: [
        "https://www.wallpapertip.com/wmimgs/37-370633_birds-hd-wallpapers-for-mobile-birds-wallpaper-hd.jpg"
      ],
      sex: true,
      weight: 10,
    ),
  ];

  List<Rabbit> _rabbits = [
    Rabbit(
      id: 16,
      name: "Taylor",
      age: 2,
      category: "Rabbit",
      color: "Green",
      height: 50,
      imageUrls: [
        "https://i.pinimg.com/750x/e3/ba/3a/e3ba3a1affb368b3ca9052d6540a430b.jpg",
      ],
      sex: false,
      weight: 30,
    ),
    Rabbit(
      id: 17,
      name: "Berisha",
      age: 3,
      category: "Rabbit",
      color: "Purple",
      height: 20,
      imageUrls: [
        "https://images.unsplash.com/photo-1585504989076-76dc39c74ac3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGV0JTIwcmFiYml0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
      ],
      sex: true,
      weight: 10,
    ),
    Rabbit(
      id: 18,
      name: "Osai",
      age: 6,
      category: "Rabbit",
      color: "Pink",
      height: 70,
      imageUrls: [
        "https://i.pinimg.com/736x/18/c2/a5/18c2a5876ee529b338c0020a3f857759.jpg",
      ],
      sex: false,
      weight: 40,
    ),
    Rabbit(
      id: 19,
      name: "Ferdi",
      age: 5,
      category: "Rabbit",
      color: "Black",
      height: 60,
      imageUrls: [
        "https://image.freepik.com/free-photo/portrait-cute-fluffy-gray-rabbit-with-ears-natural-green_78492-3801.jpg",
      ],
      sex: true,
      weight: 25,
    ),
    Rabbit(
      id: 20,
      name: "Valencia",
      age: 1,
      category: "Rabbit",
      color: "Green",
      height: 40,
      imageUrls: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHcQu2bshegSQTjcanwRyfYR9jQumX8oNRunXvWypbn0W8db1Egn9PuNs8gt6xwLkGMBU&usqp=CAU"
      ],
      sex: true,
      weight: 10,
    ),
  ];

  List<Fish> _fishes = [
    Fish(
      id: 21,
      name: "Taylor",
      age: 2,
      category: "Fish",
      color: "Green",
      height: 50,
      imageUrls: [
        "https://thumbs.dreamstime.com/b/goldfish-freshwater-aquarium-green-beautiful-planted-tropical-fish-vertical-photo-145923685.jpg",
      ],
      sex: false,
      weight: 30,
    ),
    Fish(
      id: 22,
      name: "Berisha",
      age: 3,
      category: "Fish",
      color: "Purple",
      height: 20,
      imageUrls: [
        "https://thumbs.dreamstime.com/b/tropical-colorful-fishes-swimming-aquarium-plants-goldfish-carassius-auratus-captive-fish-vertical-photo-161500552.jpg",
      ],
      sex: true,
      weight: 10,
    ),
    Fish(
      id: 23,
      name: "Osai",
      age: 6,
      category: "Fish",
      color: "Pink",
      height: 70,
      imageUrls: [
        "https://i.pinimg.com/originals/68/d0/a9/68d0a9a6785572542c973ca0b2f07dd8.jpg",
      ],
      sex: false,
      weight: 40,
    ),
    Fish(
      id: 24,
      name: "Ferdi",
      age: 5,
      category: "Fish",
      color: "Black",
      height: 60,
      imageUrls: [
        "https://st4.depositphotos.com/6591250/i/600/depositphotos_300579698-stock-photo-tropical-colorful-fishes-swimming-in.jpg",
      ],
      sex: true,
      weight: 25,
    ),
    Fish(
      id: 25,
      name: "Valencia",
      age: 1,
      category: "Fish",
      color: "Green",
      height: 40,
      imageUrls: [
        "https://lh3.googleusercontent.com/proxy/jkVODWX-0Tugq4F5MIaO4mUdtSvvubg78OzahmZGuo67A0LrZ9k7agyNNlF6zL-ASAC0HsnWZVetxEn8Nil7zYIIPG3bEKNHIR4HHciTzmr1bo24MypV2ptFlsYJHLg6yGreLzUvKCalSHFTF0pLqi1EkRbOi6Xx0YbT8YoPRUsN1D5axCrBlt9cdKGxz7T6VOETj3HYT-RvPcJw9KTETg"
      ],
      sex: true,
      weight: 10,
    ),
  ];

  @override
  Future<List<Cat>> getCats() async {
    return Future.delayed(Duration(seconds: 1), () => _cats);
  }

  @override
  Future<List<Dog>> getDogs() async {
    return Future.delayed(Duration(seconds: 1), () => _dogs);
  }

  @override
  Future<List<Bird>> getBirds() async {
    return Future.delayed(Duration(seconds: 1), () => _birds);
  }

  @override
  Future<List<Rabbit>> getRabbits() async {
    return Future.delayed(Duration(seconds: 1), () => _rabbits);
  }

  @override
  Future<List<Fish>> getFishes() async {
    return Future.delayed(Duration(seconds: 1), () => _fishes);
  }

  @override
  Future<List<Pet>> getAll() async {
    return Future.delayed(
      Duration(seconds: 1),
      () => List.from(_cats)..addAll(_dogs)..addAll(_birds)..addAll(_rabbits)..addAll(_fishes),
    );
  }
}
