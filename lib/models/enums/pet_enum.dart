enum PetEnum {
  Dog,
  Cat,
  Bird,
  Rabbit,
  Fish,
}

extension PetStringExtension on PetEnum {
  String get name {
    switch (this) {
      case PetEnum.Dog:
        return "Köpekler";
      case PetEnum.Cat:
        return "Kediler";
      case PetEnum.Bird:
        return "Kuşlar";
      case PetEnum.Rabbit:
        return "Tavşanlar";
      case PetEnum.Fish:
        return "Balıklar";
      default:
        return "None";
    }
  }
}
