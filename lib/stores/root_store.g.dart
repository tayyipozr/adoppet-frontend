// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RootStore on _RootStore, Store {
  final _$coreStoreAtom = Atom(name: '_RootStore.coreStore');

  @override
  CoreStore get coreStore {
    _$coreStoreAtom.reportRead();
    return super.coreStore;
  }

  @override
  set coreStore(CoreStore value) {
    _$coreStoreAtom.reportWrite(value, super.coreStore, () {
      super.coreStore = value;
    });
  }

  final _$petStoreAtom = Atom(name: '_RootStore.petStore');

  @override
  PetStore get petStore {
    _$petStoreAtom.reportRead();
    return super.petStore;
  }

  @override
  set petStore(PetStore value) {
    _$petStoreAtom.reportWrite(value, super.petStore, () {
      super.petStore = value;
    });
  }

  final _$authStoreAtom = Atom(name: '_RootStore.authStore');

  @override
  AuthStore get authStore {
    _$authStoreAtom.reportRead();
    return super.authStore;
  }

  @override
  set authStore(AuthStore value) {
    _$authStoreAtom.reportWrite(value, super.authStore, () {
      super.authStore = value;
    });
  }

  final _$userStoreAtom = Atom(name: '_RootStore.userStore');

  @override
  UserStore get userStore {
    _$userStoreAtom.reportRead();
    return super.userStore;
  }

  @override
  set userStore(UserStore value) {
    _$userStoreAtom.reportWrite(value, super.userStore, () {
      super.userStore = value;
    });
  }

  @override
  String toString() {
    return '''
coreStore: ${coreStore},
petStore: ${petStore},
authStore: ${authStore},
userStore: ${userStore}
    ''';
  }
}
