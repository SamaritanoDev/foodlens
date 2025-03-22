import 'dart:convert';
import 'dart:typed_data';

Photo photoFromJson(String str) => Photo.fromJson(json.decode(str));

String photoToJson(Photo data) => json.encode(data.toJson());

class Photo {
  Uint8List fileBytes;

  Photo({required this.fileBytes});

  factory Photo.fromJson(Map<String, dynamic> json) =>
      Photo(fileBytes: json["fileBytes"]);

  Map<String, dynamic> toJson() => {"fileBytes": fileBytes};
}
