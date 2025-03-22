import 'dart:convert';
import 'package:foodlens/features/inicio/model/photo.dart';
import 'package:foodlens/features/receta/model/ingrediente.dart';
import 'package:foodlens/share/model/option_value.dart';

Receta recetaFromJson(String str) => Receta.fromJson(json.decode(str));

String recetaToJson(Receta data) => json.encode(data.toJson());

class Receta extends OptionValue {
  Receta({
    required this.ingrediente,
    required this.paso,
    this.photo,
    required super.key,
    required super.value,
  });

  final List<Ingrediente> ingrediente;
  final List<OptionValue> paso;
  final Photo? photo;

  factory Receta.fromJson(Map<String, dynamic> json) => Receta(
    key: json["key"],
    value: json["value"],
    ingrediente:
        (json["ingrediente"] as List)
            .map((item) => Ingrediente.fromJson(item))
            .toList(),
    paso:
        (json["paso"] as List)
            .map((item) => OptionValue.fromJson(item))
            .toList(),
    photo: json["photo"] != null ? Photo.fromJson(json["photo"]) : null,
  );

  @override
  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
    "ingrediente": ingrediente.map((item) => item.toJson()).toList(),
    "paso": paso.map((item) => item.toJson()).toList(),
    "photo": photo?.toJson(),
  };
}
