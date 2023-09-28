class ConfiguracionDTO {
  String? urlPuente;
  String? puertoMovil;
  String? idioma;

  ConfiguracionDTO({
    this.urlPuente,
    this.puertoMovil,
    this.idioma,
  });

  factory ConfiguracionDTO.fromJson(Map<String, dynamic> json) =>
      ConfiguracionDTO(
        urlPuente: json["url_puente"],
        puertoMovil: json["puerto_movil"],
        idioma: json["idioma"],
      );

  Map<String, dynamic> toJson() => {
        "url_puente": urlPuente,
        "puerto_movil": puertoMovil,
        "idioma": idioma,
      };
}
