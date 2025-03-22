import 'dart:convert';

// Métodos para convertir entre JSON y String
OptionValue optionValueFromJson(String str) =>
    OptionValue.fromJson(json.decode(str));

String optionValueToJson(OptionValue data) => json.encode(data.toJson());

class OptionValue {
  final int key;
  final String value;

  OptionValue({required this.key, required this.value});

  factory OptionValue.fromJson(Map<String, dynamic> json) =>
      OptionValue(key: json["key"], value: json["value"]);

  Map<String, dynamic> toJson() => {"key": key, "value": value};
}
