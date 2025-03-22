import 'package:foodlens/core/state/base_state.dart';
import 'package:foodlens/features/inicio/controller/camera_controller.dart';
import 'package:foodlens/features/inicio/model/photo.dart';

class PhotoProvider extends BaseState {
  final CameraController _cameraController = CameraController();
  Photo? _photo;
  Photo? get photo => _photo;

  Future<void> capturePhoto() async {
    setLoading();

    try {
      final Photo? newPhoto = await _cameraController.takePhoto();
      if (newPhoto != null) {
        _photo = newPhoto;
        notifyListeners();
        setSuccess();
      } else {
        setError("No se pudo capturar la foto");
      }
    } catch (e) {
      setError("Error inesperado: $e");
    }
  }

  void clearPhoto() {
    _photo = null;
    reset();
  }
}
