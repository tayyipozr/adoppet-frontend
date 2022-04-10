// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PetStore on _PetStore, Store {
  final _$currentIndexAtom = Atom(name: '_PetStore.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$petsAtom = Atom(name: '_PetStore.pets');

  @override
  List<Pet> get pets {
    _$petsAtom.reportRead();
    return super.pets;
  }

  @override
  set pets(List<Pet> value) {
    _$petsAtom.reportWrite(value, super.pets, () {
      super.pets = value;
    });
  }

  final _$allPetsAtom = Atom(name: '_PetStore.allPets');

  @override
  List<Pet> get allPets {
    _$allPetsAtom.reportRead();
    return super.allPets;
  }

  @override
  set allPets(List<Pet> value) {
    _$allPetsAtom.reportWrite(value, super.allPets, () {
      super.allPets = value;
    });
  }

  final _$getAdoptedAsyncAction = AsyncAction('_PetStore.getAdopted');

  @override
  Future<List<Pet>> getAdopted() {
    return _$getAdoptedAsyncAction.run(() => super.getAdopted());
  }

  final _$getFavoritesAsyncAction = AsyncAction('_PetStore.getFavorites');

  @override
  Future<List<Pet>> getFavorites() {
    return _$getFavoritesAsyncAction.run(() => super.getFavorites());
  }

  final _$getAsyncAction = AsyncAction('_PetStore.get');

  @override
  Future<void> get() {
    return _$getAsyncAction.run(() => super.get());
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
pets: ${pets},
allPets: ${allPets}
    ''';
  }
}
