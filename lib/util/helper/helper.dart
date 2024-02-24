import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class Helper {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 600;

  // Check if the device is considered as tablet based on screen width.
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 600 &&
      MediaQuery.of(context).size.width <= 1200;

  // Check if the device is considered as desktop based on screen width.
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1200;

  Map<String, String> getHeaders(
      {bool hasToken = true, bool multipartRequest = false}) {
    Map<String, String> headers = {
      'ShopID': '1',
      'Authorization': 'tpbf49bdlr9202103tsptatpa',
      'Accept': 'application/json',
    };
    headers['Content-Type'] = 'application/json';

    return headers;
  }

  static showSnackBar(bool isError, String message, BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green));
  }

  Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return Future.delayed(const Duration(seconds: 1), () {
        return true;
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return Future.delayed(const Duration(seconds: 1), () {
        return true;
      });
    } else {
      return Future.delayed(const Duration(seconds: 1), () {
        return false;
      });
    }
  }
}
