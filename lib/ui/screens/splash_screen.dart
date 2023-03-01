import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:template_provider_mvvm/core/constants/utils.dart';
import 'package:template_provider_mvvm/core/models/other/onboarding.dart';
import 'package:template_provider_mvvm/core/others/logger_customization/custom_logger.dart';
import 'package:template_provider_mvvm/core/services/authentication/custom%20backend/auth_service.dart';
import 'package:template_provider_mvvm/core/services/local_storage_service.dart';
import 'package:template_provider_mvvm/core/services/notification_service.dart';
import 'package:template_provider_mvvm/locator.dart';
import 'package:template_provider_mvvm/ui/custom_widgets/dialogs/network_error_dialog.dart';
import 'package:template_provider_mvvm/ui/screens/authentication/login_screen/login_screen.dart';
import 'package:template_provider_mvvm/ui/screens/navigation/navigation_screen.dart';
import 'package:template_provider_mvvm/ui/screens/onboarding/onboarding_screen.dart';

import '../../core/services/authentication/firebase/fire_auth.dart';
import '../../core/services/navigation_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/splash';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final _authService = locator<AuthService>();
  final _authService = locator<FireAuth>();
  final _localStorageService = locator<LocalStorageService>();
  final _notificationService = locator<NotificationsService>();
  final NavigationService navigationService = locator<NavigationService>();
  List<Onboarding> onboardingList = [];
  final Logger log = CustomLogger(className: 'Splash Screen');

  @override
  void didChangeDependencies() {
    _initialSetup();
    super.didChangeDependencies();
  }

  _initialSetup() async {
    await _localStorageService.init();

    ///
    /// If not connected to internet, show an alert dialog
    /// to activate the network connection.
    ///
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      show_dialog(NetworkErrorDialog());
      return;
    }

    ///
    ///initializing notification services
    ///
    await _notificationService.initConfigure();

    ///
    /// Use the below [_getOnboardingData] method if the
    /// onboarding is dynamic (Means onboarding data coming from
    /// the apis)
    ///
    onboardingList = await _getOnboardingData();

    ///
    /// Routing to the last onboarding screen user seen
    ///
    if (_localStorageService.onBoardingPageCount + 1 < onboardingList.length) {
      ///
      /// For better user experience we precache onboarding images in case
      /// they are coming from a remote server.
      /// Remove it if onboarding is static.
      ///
      final List<Image> preCachedImages =
          await _preCacheOnboardingImages(onboardingList);

      // navigationService.navigateTo(OnboardingScreen.routeName,
      //     arguments: OnboardingScreenArguments(
      //         currentIndex: _localStorageService.onBoardingPageCount,
      //         onboardingList: onboardingList,
      //         preCachedImages: preCachedImages));
      // await Get.to(() => OnboardingScreen(
      //     currentIndex: _localStorageService.onBoardingPageCount,
      //     onboardingList: onboardingList,
      //     preCachedImages: preCachedImages));
      return;
    }
    //await _authService.doSetup();

    ///
    ///checking if the user is login or not
    ///
    log.d(
        '@_initialSetup. Login State: ${_authService.currentUser == null ? "Loggied in" : "Not Logged in"}');

    Timer(Duration(seconds: 2), () {
      log.e(
          "@initState User is ${_authService.currentUser == null ? "null" : "not null"}");
      if (_authService.currentUser != null) {
        navigationService.navigateTo(NavigationScreen.routeName);
      } else {
        navigationService.navigateTo(LoginScreen.routeName);
      }

      super.initState();
    });
  }

  Future<List<Image>> _preCacheOnboardingImages(
      List<Onboarding> onboardingList) async {
    List<Image> preCachedImages =
        onboardingList.map((e) => Image.network(e.imgUrl!)).toList();
    for (Image preCacheImg in preCachedImages) {
      await precacheImage(preCacheImg.image, context);
    }
    return preCachedImages;
  }

  // ignore: unused_element
  _getOnboardingData() async {
    ///uncomment below code
    // final response = await _dbService.getOnboardingData();
    // if (response.success) {
    //   return response.onboardingsList;
    // } else {
    //   return [];
    // }
    List<Onboarding> onboardings = [];
    return onboardings;
  }

  @override
  Widget build(BuildContext context) {
    ///
    /// Splash Screen UI goes here.
    ///
    return const Scaffold(
      body: Center(child: Text('Splash Screen')),
    );
  }
}
