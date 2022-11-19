import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peticiones_http/domain/controller/controlfotos.dart';
import 'package:peticiones_http/domain/controller/controlpost.dart';

import 'ui/app.dart';

void main() {
  Get.put(ControlFotos());
  Get.put(ControlPost());
  runApp(const App());
}
