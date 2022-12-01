import 'package:coworkerdriver/data/services/peticionFirebaseAuthConductor.dart';
import 'package:coworkerdriver/domain/modelo/conductor.dart';
import 'package:get/get.dart';

class ConductorController extends GetxController {
  final Rxn<List<Conductor>> _listaDeUsuarios = Rxn<List<Conductor>>();

  Future<void> consultaArticulos() async {
    _listaDeUsuarios.value = await PeticionesConductor.consultarGral();
    print("pintando lista consultada");

    print(_listaDeUsuarios);
    print("FIn pintando lista consultada");
  }

  List<Conductor>? get getArticulosGral => _listaDeUsuarios.value;
}
