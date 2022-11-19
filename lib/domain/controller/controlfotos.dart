import 'package:get/get.dart';
import 'package:peticiones_http/data/services/peticionesfotos.dart';
import 'package:peticiones_http/domain/models/fotos.dart';

class ControlFotos extends GetxController {
  final Rxn<List<Fotos>> _listarfotos = Rxn<List<Fotos>>();

  Future<void> consultarFotos() async {
    _listarfotos.value = await PeticionesFotos.consultasfotos();
    // print(_listarfotos.value);
  }

  List<Fotos>? get listarfotos => _listarfotos.value;
}
