import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:template_provider_mvvm/core/constants/colors.dart';

import '../../../core/constants/strings.dart';
import '../../custom_widgets/bottom_nav_bar/fab_bar.dart';
import '../../custom_widgets/image_container.dart';
import 'navigation_view_model.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);
  static const String routeName = "/navigation-screen";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NavigationScreenViewModel(),
        child: Consumer<NavigationScreenViewModel>(
          builder: (context, model, child) => WillPopScope(
            onWillPop: () async {
              // final status = await Get.dialog(AlertDialog(
              //   title: const Text('Caution!'),
              //   content:
              //       const Text('Do you really want to close the application?'),
              //   actions: [
              //     ElevatedButton(
              //       onPressed: () {
              //         Get.back(result: true);
              //       },
              //       child: const Text('Yes'),
              //     ),
              //     ElevatedButton(
              //       onPressed: () {
              //         Get.back(result: false);
              //       },
              //       child: const Text('No'),
              //     ),
              //   ],
              // ));

              /// In case user has chosen not to be kept logged in,
              /// he will get logged out of the app on exit.
              // if (status && !locator<AuthService>().isRememberMe) {
              //   await locator<AuthService>().logout();
              // }
              return false;
            },
            child: Scaffold(
              extendBody: true,
              body: model.allScreen[model.selectedScreen],

              bottomNavigationBar: model.isEnableBottomBar
                  ? FABBottomAppBar(
                      color: Colors.grey,
                      backgroundColor: Colors.grey,
                      selectedColor: kPrimary1,
                      notchedShape: const CircularNotchedRectangle(),
                      onTabSelected: model.updatedScreenIndex,
                      items: [
                        FABBottomAppBarItem(
                          icon: ImageContainer(
                            height: 30.h,
                            width: 30.h,
                            assets: "${staticAssetsPath}bottom_home_icon.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        FABBottomAppBarItem(
                          icon: ImageContainer(
                            height: 30.h,
                            width: 30.h,
                            assets: "${staticAssetsPath}bottom_card_icon.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        FABBottomAppBarItem(
                          icon: ImageContainer(
                            height: 30.h,
                            width: 30.h,
                            assets:
                                "${staticAssetsPath}bottom_category_icon.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        FABBottomAppBarItem(
                          icon: ImageContainer(
                            height: 30.h,
                            width: 30.h,
                            assets:
                                "${staticAssetsPath}bottom_profile_icon.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    )
                  : Container(),
//      body: _list[_page],
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: model.isEnableBottomBar
                  ? FloatingActionButton(
                      backgroundColor: kPrimary1,
                      onPressed: () {},
                      elevation: 2.0,
                      child: const Icon(Icons.add),
                    )
                  : Container(),
            ),
          ),
        ));
  }
}
