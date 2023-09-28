class ErrorDto {
  String codigo;
  String mensaje;
  String recomendacion;

  ErrorDto({
    required this.codigo,
    required this.mensaje,
    required this.recomendacion,
  });

  factory ErrorDto.fromJson(Map<String, dynamic> json) => ErrorDto(
        codigo: json["code"],
        mensaje: json["message"],
        recomendacion: json["recomen"],
      );

  Map<String, dynamic> toJson() => {
        "code": codigo,
        "message": mensaje,
        "recomen": recomendacion,
      };
}
