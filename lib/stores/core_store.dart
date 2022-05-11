import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'core_store.g.dart';

class CoreStore = _CoreStore with _$CoreStore;

abstract class _CoreStore with Store {
  _CoreStore();

  @observable
  ThemeData themeData = ThemeData.dark();

  @action
  void changeTheme() {
    themeData = ThemeData.dark().copyWith(
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
      primaryColor: Colors.black,
      textTheme: TextTheme(),
      cardColor: Colors.grey,
      scaffoldBackgroundColor: Colors.black,
      sliderTheme: SliderThemeData(
        trackHeight: 2,
        activeTrackColor: Colors.green,
        thumbColor: Colors.green,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 4),
      ),
    );
  }
}
