import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

import '../others/logger_customization/custom_logger.dart';

class LocationService {
  Position? currentLocation;
  double? latitude;
  double? longitude;
  final Logger log = CustomLogger(className: 'LocationService');

  ///returns [Position] for the current location
  Future<Position?> getCurrentLocation(BuildContext context) async {
    currentLocation = await Geolocator.getCurrentPosition();
    if (currentLocation == null) {
      await checkPermissionStatus();
      await checkGpsService(context);
    }
    log.d(
        'Latitude: ${currentLocation!.latitude}, Longitude: ${currentLocation!.longitude}');
    return currentLocation;
  }

  ///checks the location permission and requests permission if not granted
  checkPermissionStatus() async {
    LocationPermission permission = await checkPermissionStatus();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await Permission.location.request();
    }
  }

  checkGpsService(BuildContext context) async {
    if (await Geolocator.isLocationServiceEnabled()) {
//show_dialog(context, widget)

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Text(
                        'ADD CATEGORY',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      color: Colors.redAccent,
                    )
                  ],
                ),
                elevation: 12.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)));
          });

      //   Get.defaultDialog(
      //       title: 'GPS is Disabled',
      //       middleText: 'Please turn on your GPS Location',
      //       textConfirm: 'TURN ON',
      //       onConfirm: () async {
      //         await Geolocator.openLocationSettings();

      //         Navigator.pop(context);
      //       },
      //       textCancel: 'Skip',
      //       onCancel: () {});
      // }
    }

    ///returns the address for the provided [LatLng]
    Future<String> getAddressFromLatLng(LatLng? location) async {
      try {
        List<Placemark> placeMarks = await placemarkFromCoordinates(
            location!.latitude, location.longitude);

        Placemark place = placeMarks[0];
        log.d("the location is  ${place.thoroughfare} "
            " ${place.subLocality}"
            " ${place.locality}"
            " ${place.country}");
        return "${place.thoroughfare} ${place.subLocality} ${place.locality} ${place.country}";
      } catch (e) {
        log.d("the exception is $e");
        return '';
      }
    }
  }
}
