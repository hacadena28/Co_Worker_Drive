import 'package:get/get.dart';

import '../../data/services/peticionFirebaseAuthPasajero.dart';
import '../modelo/pasajero.dart';

class PasajeroController extends GetxController {
  final Rxn<List<Pasajero>> _listaDeUsuarios = Rxn<List<Pasajero>>();

  Future<void> consultaArticulos() async {
    _listaDeUsuarios.value = await PeticionesPasajero.consultarGral();
    print(_listaDeUsuarios);
  }

  List<Pasajero>? get getArticulosGral => _listaDeUsuarios.value;
}
