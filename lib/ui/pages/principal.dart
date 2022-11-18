import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peticiones_http/domain/controller/controlpost.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    ControlPost controlp = Get.find();
    controlp.consultarPost().then((value) => null);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Comentarios'),
      ),
      body: Obx(
        () => controlp.listarpost?.isNotEmpty == true
            ? ListView.builder(
                itemCount: controlp.listarpost?.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(controlp.listarpost![i].userId.toString()),
                    ),
                    title: Text(controlp.listarpost![i].title.toString()),
                    subtitle: Text(controlp.listarpost![i].body.toString()),
                    trailing: CircleAvatar(
                      child: Text(controlp.listarpost![i].id.toString()),
                    ),
                  );
                })
            : const Icon(Icons.abc),
      ),
    );
  }
}
