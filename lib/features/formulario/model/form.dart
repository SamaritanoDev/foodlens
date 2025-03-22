import 'dart:convert';
import 'package:foodlens/share/model/option_value.dart';

class FormModel {
  final List<OptionValue> preferenciasComida;

  FormModel({required this.preferenciasComida});
  
//Develueve una instancia de FormModel
  factory FormModel.fromJson(Map<String, dynamic> json) {
    return FormModel(
      preferenciasComida: List<OptionValue>.from(
        json["preferenciasComida"].map((x) => OptionValue.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "preferenciasComida": List<dynamic>.from(
        preferenciasComida.map((x) => x.toJson()),
      ),
    };
  }
}

// Métodos para convertir entre JSON y String
FormModel formModelFromJson(String str) => FormModel.fromJson(json.decode(str));

String formModelToJson(FormModel data) => json.encode(data.toJson());
