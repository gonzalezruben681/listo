class SesionDTO {
  SesionDTO(
      {required this.usuario,
      required this.token,
      required this.tokenExpira,
      required this.codigoUsuario});

  String usuario;
  String token;
  String tokenExpira;
  int codigoUsuario;

  factory SesionDTO.fromJson(Map<String, dynamic> json) => SesionDTO(
      usuario: json["usuario"],
      token: json["token"],
      tokenExpira: json["token_expira"],
      codigoUsuario: json["codigo_usuario"]);

  Map<String, dynamic> toJson() => {
        "usuario": usuario,
        "token": token,
        "token_expira": tokenExpira,
        "codigo_usuario": codigoUsuario
      };
}

