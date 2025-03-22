import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'package:foodlens/features/receta/model/receta.dart';
import 'package:foodlens/share/constants/constants.dart';
import 'package:foodlens/share/constants/instruccion.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ServiceController {
  late final GenerativeModel model;

  ServiceController() {
    final schema = Schema.array(
      description:
          'Lista de recetas generadas a partir de la imagen de los ingredientes.',
      items: Schema.object(
        properties: {
          'key': Schema.integer(
            description: 'ID único de la receta.',
            nullable: false,
          ),
          'value': Schema.string(
            description: 'Nombre de la receta.',
            nullable: false,
          ),
          //todo: propiedades del modelo/json de la receta
        },
      ),
    );

    //creacion del modelo de gemieni
    model = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: apikey,
      generationConfig: GenerationConfig(
        responseMimeType: 'application/json',
        responseSchema: schema,
      ),
    );
  }

  Future<Receta?> generarReceta(
    Uint8List bytes,
    String preferenciaComida,
  ) async {
    //inicializar promt e imageParts

    final prompt = TextPart('$promtText $preferenciaComida.');
    final imageParts = [DataPart('image/png', bytes)];

    try {
      final response = await model.generateContent([
        Content.multi([prompt, ...imageParts]),
      ]);

      //validacion si la restapuesta es != null
    } catch (error) {
      debugPrint("Error al generar receta: $error");
    }
    return null;
  }
}
