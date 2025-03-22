import 'dart:convert';
import 'package:foodlens/share/model/option_value.dart';

Ingrediente ingredienteFromJson(String str) =>
    Ingrediente.fromJson(json.decode(str));

String ingredienteToJson(Ingrediente data) => json.encode(data.toJson());

class Ingrediente extends OptionValue {
  Ingrediente({
    required super.key,
    required super.value,
    required this.pesoGramo,
  });
  final String pesoGramo;

  factory Ingrediente.fromJson(Map<String, dynamic> json) => Ingrediente(
    key: json["key"],
    value: json["value"],
    pesoGramo: json["pesoGramo"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
    "pesoGramo": pesoGramo,
  };
}
