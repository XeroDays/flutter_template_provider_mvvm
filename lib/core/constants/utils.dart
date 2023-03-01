import 'package:flutter/material.dart';

import '../../locator.dart';
import '../services/navigation_service.dart';

TextStyle myStyle(double size, bool isBold,
    {Color color = Colors.black,
    FontWeight overrideBold = FontWeight.bold,
    String? overrideFontFamily}) {
  return TextStyle(
      fontSize: size,
      fontWeight: (isBold) ? overrideBold : FontWeight.normal,
      fontFamily: overrideFontFamily,
      color: color);
}

show_dialog(Widget widget) {
  NavigationService navigationService = locator<NavigationService>();

  showDialog(
      context: navigationService.getNavigationContext(),
      builder: (context) => widget);
}
