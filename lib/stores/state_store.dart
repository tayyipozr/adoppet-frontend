import 'package:mobx/mobx.dart';

part 'state_store.g.dart';

enum LoadingState { initial, loading, loaded, error }

class StateStore = _StateStore with _$StateStore;

abstract class _StateStore with Store {
  List<ReactionDisposer> _disposers = [];

  _StateStore() {
    _disposers = [
      reaction((_) => _errorMessage, resetErrorMessage, delay: 200),
    ];
  }

  @observable
  LoadingState state = LoadingState.initial;

  @observable
  String? _errorMessage;

  @computed
  get errorMessage => _errorMessage;

  @computed
  bool get hasErrorMessage => _errorMessage != null;

  @computed
  bool get isInitial => state == LoadingState.initial;

  @computed
  bool get isLoaded => state == LoadingState.loaded;

  @computed
  bool get isLoading => state == LoadingState.loading;

  @computed
  bool get isError => state == LoadingState.error;

  @action
  void resetLoading() {
    state = LoadingState.initial;
  }

  @action
  void startLoading() {
    state = LoadingState.loading;
  }

  @action
  void finishLoading() {
    state = LoadingState.loaded;
  }

  @action
  void onError() {
    state = LoadingState.error;
  }

  @action
  void setErrorMessage(String? errorMessage) {
    this._errorMessage = errorMessage;
  }

  @action
  void resetErrorMessage(String? errorMessage) {
    _errorMessage = null;
  }

  @action
  dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
