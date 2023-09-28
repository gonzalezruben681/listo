/// Import Flutter

class LoginDto {
  LoginDto({
    this.correo,
    this.celular,
    required this.clave,
    this.codigoRuta,
    this.plataforma,
    this.version,
  });

  String? correo;
  String? celular;
  String clave;
  int? codigoRuta;
  String? plataforma;
  String? version;

  factory LoginDto.fromJson(Map<String, dynamic> json) => LoginDto(
      correo: json["correo"],
      celular: json["celular"],
      clave: json["clave"],
      codigoRuta: json["codigo_ruta"]);

  Map<String, dynamic> toJson() => {
        "correo": correo,
        "celular": celular,
        "clave": clave,
        "codigo_ruta": codigoRuta,
        "plataforma": plataforma,
        "version": version
      };
}
