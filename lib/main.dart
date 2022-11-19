import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peticiones_http/domain/controller/controlconexion.dart';
import 'package:peticiones_http/domain/controller/controlfotos.dart';
import 'package:peticiones_http/domain/controller/controlpost.dart';
import 'package:peticiones_http/domain/controller/controluser.dart';

import 'ui/app.dart';

void main() {


  // Connectivity Controller
  ControlConexion connectivityController =
      Get.put(ControlConexion());
  // Connectivity stream
  Connectivity().onConnectivityChanged.listen((connectivityStatus) {
    connectivityController.connectivity = connectivityStatus;
  });


  Get.put(ControlUser());
  Get.put(ControlFotos());
  Get.put(ControlPost());
  runApp(const App());
}
