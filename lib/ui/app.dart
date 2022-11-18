import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peticiones_http/ui/pages/principal.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peticiones Http',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: const Principal(),
    );
  }
}
