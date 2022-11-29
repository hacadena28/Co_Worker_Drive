import 'package:coworkerdriver/data/services/peticionesuser.dart';
import 'package:coworkerdriver/domain/modelo/user.dart';
import 'package:get/get.dart';

class ControllerUser extends GetxController {
  final Rxn<List<User>> _users = Rxn<List<User>>();
  Future<void> enviaruser(String u, String p) async {
    _users.value = await PeticionesUser.validarUser(u, p);
  }

  List<User>? get listauser => _users.value;
}
