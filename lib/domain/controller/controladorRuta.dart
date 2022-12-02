import 'package:coworkerdriver/data/services/peticionFirebaseAuthConductor.dart';
import 'package:coworkerdriver/data/services/peticionesFirebaseRuta.dart';
import 'package:coworkerdriver/domain/modelo/conductor.dart';
import 'package:coworkerdriver/domain/modelo/ruta.dart';
import 'package:get/get.dart';

class RutaController extends GetxController {
  final Rxn<List<Ruta>> _listaDeRutas = Rxn<List<Ruta>>();

  Future<void> consultaRutas() async {
    _listaDeRutas.value = await PeticionesRuta.consultarGral();
    print("pintando lista consultada");

    print(_listaDeRutas);
    print("FIn pintando lista consultada");
  }

  List<Ruta>? get getArticulosGral => _listaDeRutas.value;
}
