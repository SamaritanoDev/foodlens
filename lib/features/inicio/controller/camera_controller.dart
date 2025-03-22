import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:foodlens/features/inicio/model/photo.dart';
import 'package:image_picker/image_picker.dart';

class CameraController {
  //inicializar ImagePicker
  final ImagePicker _picker = ImagePicker();

  Future<Photo?> takePhoto() async {
    try {
      //todo: tomar foto mete
    } catch (e) {
      debugPrint("Error en la cámara: $e");
    }
    return null;
  }
}
