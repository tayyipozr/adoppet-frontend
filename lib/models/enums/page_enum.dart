enum PageEnum { Adopted, Favorites }

extension PetStringExtension on PageEnum {
  String get name {
    switch (this) {
      case PageEnum.Adopted:
        return "Adopted";
      case PageEnum.Favorites:
        return "Favorites";
      default:
        return "None";
    }
  }
}
