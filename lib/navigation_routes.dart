import 'package:animal/constants/navigation_constants.dart';
import 'package:animal/models/enums/page_enum.dart';
import 'package:animal/pages/homepage/home_page.dart';
import 'package:animal/pages/userpages/adopted_pets_page.dart';
import 'package:flutter/material.dart';

class NavigationRoute {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationConstants.HOME:
        return _navigate(HomePage());
      case NavigationConstants.ADOPTED_PETS:
        return _navigate(AdoptedPetsPage(settings.arguments as PageEnum));
    }
    return _navigate(Scaffold(body: Center(child: Text("Page Not Found"))));
  }

  MaterialPageRoute _navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) {
      return widget;
    });
  }
}
