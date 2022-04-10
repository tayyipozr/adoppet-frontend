// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CoreStore on _CoreStore, Store {
  final _$themeDataAtom = Atom(name: '_CoreStore.themeData');

  @override
  ThemeData get themeData {
    _$themeDataAtom.reportRead();
    return super.themeData;
  }

  @override
  set themeData(ThemeData value) {
    _$themeDataAtom.reportWrite(value, super.themeData, () {
      super.themeData = value;
    });
  }

  final _$_CoreStoreActionController = ActionController(name: '_CoreStore');

  @override
  void changeTheme() {
    final _$actionInfo = _$_CoreStoreActionController.startAction(
        name: '_CoreStore.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$_CoreStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themeData: ${themeData}
    ''';
  }
}
