// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StateStore on _StateStore, Store {
  Computed<dynamic>? _$errorMessageComputed;

  @override
  dynamic get errorMessage =>
      (_$errorMessageComputed ??= Computed<dynamic>(() => super.errorMessage,
              name: '_StateStore.errorMessage'))
          .value;
  Computed<bool>? _$hasErrorMessageComputed;

  @override
  bool get hasErrorMessage =>
      (_$hasErrorMessageComputed ??= Computed<bool>(() => super.hasErrorMessage,
              name: '_StateStore.hasErrorMessage'))
          .value;
  Computed<bool>? _$isInitialComputed;

  @override
  bool get isInitial => (_$isInitialComputed ??=
          Computed<bool>(() => super.isInitial, name: '_StateStore.isInitial'))
      .value;
  Computed<bool>? _$isLoadedComputed;

  @override
  bool get isLoaded => (_$isLoadedComputed ??=
          Computed<bool>(() => super.isLoaded, name: '_StateStore.isLoaded'))
      .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??=
          Computed<bool>(() => super.isLoading, name: '_StateStore.isLoading'))
      .value;
  Computed<bool>? _$isErrorComputed;

  @override
  bool get isError => (_$isErrorComputed ??=
          Computed<bool>(() => super.isError, name: '_StateStore.isError'))
      .value;

  final _$stateAtom = Atom(name: '_StateStore.state');

  @override
  LoadingState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(LoadingState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$_errorMessageAtom = Atom(name: '_StateStore._errorMessage');

  @override
  String? get _errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  final _$_StateStoreActionController = ActionController(name: '_StateStore');

  @override
  void resetLoading() {
    final _$actionInfo = _$_StateStoreActionController.startAction(
        name: '_StateStore.resetLoading');
    try {
      return super.resetLoading();
    } finally {
      _$_StateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startLoading() {
    final _$actionInfo = _$_StateStoreActionController.startAction(
        name: '_StateStore.startLoading');
    try {
      return super.startLoading();
    } finally {
      _$_StateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void finishLoading() {
    final _$actionInfo = _$_StateStoreActionController.startAction(
        name: '_StateStore.finishLoading');
    try {
      return super.finishLoading();
    } finally {
      _$_StateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onError() {
    final _$actionInfo =
        _$_StateStoreActionController.startAction(name: '_StateStore.onError');
    try {
      return super.onError();
    } finally {
      _$_StateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorMessage(String? errorMessage) {
    final _$actionInfo = _$_StateStoreActionController.startAction(
        name: '_StateStore.setErrorMessage');
    try {
      return super.setErrorMessage(errorMessage);
    } finally {
      _$_StateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetErrorMessage(String? errorMessage) {
    final _$actionInfo = _$_StateStoreActionController.startAction(
        name: '_StateStore.resetErrorMessage');
    try {
      return super.resetErrorMessage(errorMessage);
    } finally {
      _$_StateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo =
        _$_StateStoreActionController.startAction(name: '_StateStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_StateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
errorMessage: ${errorMessage},
hasErrorMessage: ${hasErrorMessage},
isInitial: ${isInitial},
isLoaded: ${isLoaded},
isLoading: ${isLoading},
isError: ${isError}
    ''';
  }
}
