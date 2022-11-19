import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peticiones_http/domain/controller/controlfotos.dart';

class Album extends StatelessWidget {
  const Album({super.key});

  @override
  Widget build(BuildContext context) {
    ControlFotos cf = Get.find();
    cf.consultarFotos().then(
          (value) => null,
        );
    return Scaffold(
      appBar: AppBar(title: const Text('Albumes')),
      body: Obx(() => cf.listarfotos!.isNotEmpty == true
          ? ListView.builder(
              itemCount: cf.listarfotos!.length,
              itemBuilder: ((context, i) {
                return Column(
                  children: [
                    Text(cf.listarfotos![i].title),
                    Image.network(cf.listarfotos![i].url)
                  ],
                );
              }),
            )
          : const Icon(Icons.abc)),
    );
  }
}
