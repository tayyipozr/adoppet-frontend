enum PageEnum { Adopted, Favorites, Requests, Applications }

extension PetStringExtension on PageEnum {
  String get name {
    switch (this) {
      case PageEnum.Adopted:
        return "Adopted";
      case PageEnum.Favorites:
        return "Favorites";
      case PageEnum.Requests:
        return "Requests";
      case PageEnum.Applications:
        return "Applications";
      default:
        return "None";
    }
  }
}
