// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adopt_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdoptStore on _AdoptStore, Store {
  final _$adoptionRequestsAtom = Atom(name: '_AdoptStore.adoptionRequests');

  @override
  List<Adoption> get adoptionRequests {
    _$adoptionRequestsAtom.reportRead();
    return super.adoptionRequests;
  }

  @override
  set adoptionRequests(List<Adoption> value) {
    _$adoptionRequestsAtom.reportWrite(value, super.adoptionRequests, () {
      super.adoptionRequests = value;
    });
  }

  final _$applicationsAtom = Atom(name: '_AdoptStore.applications');

  @override
  List<Adoption> get applications {
    _$applicationsAtom.reportRead();
    return super.applications;
  }

  @override
  set applications(List<Adoption> value) {
    _$applicationsAtom.reportWrite(value, super.applications, () {
      super.applications = value;
    });
  }

  final _$adoptionsAtom = Atom(name: '_AdoptStore.adoptions');

  @override
  List<Adoption> get adoptions {
    _$adoptionsAtom.reportRead();
    return super.adoptions;
  }

  @override
  set adoptions(List<Adoption> value) {
    _$adoptionsAtom.reportWrite(value, super.adoptions, () {
      super.adoptions = value;
    });
  }

  @override
  String toString() {
    return '''
adoptionRequests: ${adoptionRequests},
applications: ${applications},
adoptions: ${adoptions}
    ''';
  }
}
