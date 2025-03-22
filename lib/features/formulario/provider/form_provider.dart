import 'dart:typed_data';
import 'package:foodlens/core/state/base_state.dart';
import 'package:foodlens/features/receta/model/receta.dart';
import 'package:foodlens/share/services/service.dart';

class FormProvider extends BaseState {
  final ServiceController _service = ServiceController();

  Future<Receta?> generarReceta(
    Uint8List imageBytes,
    String preferenciaComida,
  ) async {
    setLoading();
    try {
      final receta = await _service.generarReceta(
        imageBytes,
        preferenciaComida,
      );
      setSuccess();
      return receta;
    } catch (e) {
      setError("Error al generar la receta: $e");
      return null;
    }
  }
}
