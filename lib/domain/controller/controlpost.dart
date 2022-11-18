import 'package:get/get.dart';
import 'package:peticiones_http/data/services/peticionespost.dart';
import 'package:peticiones_http/domain/models/post.dart';

class ControlPost extends GetxController {
  final Rxn<List<Post>> _listarpost = Rxn<List<Post>>();

  Future<void> consultarPost() async {
    _listarpost.value = await PeticionesPost.consultaspost();
    print(_listarpost.value);
  }

  List<Post>? get listarpost => _listarpost.value;
}
