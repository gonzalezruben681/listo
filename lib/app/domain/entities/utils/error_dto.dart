/// Import Flutter
import 'dart:convert';

class ErrorDto {
  String codigo;
  String mensaje;
  String recomendacion;

  ErrorDto(
      {required this.codigo, required this.mensaje, required this.recomendacion});

  factory ErrorDto.fromJson(Map<String, dynamic> json) => ErrorDto(
        codigo: json["code"],
        mensaje: json["message"],
        recomendacion: json["recomen"],
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "code": codigo,
        "message": mensaje,
        "recomen": recomendacion,
      };

  Map<String, dynamic> convertirObjectToJson({Object? object}) {
    return json.decode(jsonEncode(object).toString());
  }
}
