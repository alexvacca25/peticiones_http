import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peticiones_http/domain/controller/controlconexion.dart';
import 'package:peticiones_http/domain/controller/controluser.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController u = TextEditingController();
  TextEditingController p = TextEditingController();
  ControlUser controlu = Get.find();
  ControlConexion controlc = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircleAvatar(
              child: Obx(
                () => controlc.conectado
                    ? const Icon(
                        Icons.accessibility_rounded,
                        size: 50,
                      )
                    : const Icon(
                        Icons.wifi_off_rounded,
                        size: 50,
                      ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: u,
              decoration:
                  const InputDecoration(labelText: 'Ingrese el Usuario'),
            ),
            TextField(
              controller: p,
              obscureText: true,
              decoration:
                  const InputDecoration(labelText: 'Ingrese la Contraseña'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                controlu.consultarUser(u.text, p.text).then((value) {
                  print(controlu.listaruser!.length);
                  if (controlu.listaruser!.isNotEmpty != false) {
                    Get.toNamed('/fotos');
                  } else {
                    Get.showSnackbar(const GetSnackBar(
                      title: 'Validacion de Usuarios',
                      message: 'Usuario o Contraseña Invalidos',
                      icon: Icon(Icons.warning_amber),
                      duration: Duration(seconds: 5),
                      backgroundColor: Colors.red,
                    ));
                  }
                });
              },
              child: const Text('Login'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Registro'),
            )
          ]),
        ),
      ),
    );
  }
}
