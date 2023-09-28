/// Import Flutter
import 'dart:convert';

class GenericoDTO {
  int? status;
  Object? payload;

  GenericoDTO({this.status, this.payload});

  factory GenericoDTO.fromJson(Map<String, dynamic> json) => GenericoDTO(
        status: json["status"],
        payload: json["payload"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "payload": payload,
      };

  Map<String, dynamic> jsonStringify(Object? object) {
    return json.decode(jsonEncode(object).toString());
  }
}
