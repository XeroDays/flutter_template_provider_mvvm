import 'package:flutter/material.dart';
import 'package:template_provider_mvvm/core/enums/view_state.dart';
import 'package:template_provider_mvvm/core/others/base_view_model.dart';

class NavigationScreenViewModel extends BaseViewModel {
  List<Widget> allScreen = [
    // AppDrawer(child: DashboardScreen()),
    // MyCardScreen(),
    // CategoryScreen(enableBackButton: false),
    // ProfileScreen()
  ];
  int selectedScreen = 0;

  bool isEnableBottomBar = true;

  updatedScreenIndex(int index) {
    setState(ViewState.busy);
    selectedScreen = index;
    setState(ViewState.idle);
  }

  updateBottomBarStatus(bool val) {
    isEnableBottomBar = val;
    notifyListeners();
  }
}
