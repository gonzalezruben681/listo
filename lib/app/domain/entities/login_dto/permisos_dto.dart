class PermisosDTO {
  List<dynamic>? clientes;
  List<dynamic>? venta;
  List<dynamic>? consultas;
  List<dynamic>? mensajes;
  List<dynamic>? recaudo;
  List<dynamic>? recargas;
  List<dynamic>? rifas;
  List<dynamic>? anulaciones;
  List<dynamic>? tienda;
  List<dynamic>? enrutamientoCredito;

  PermisosDTO({
    this.clientes,
    this.venta,
    this.consultas,
    this.mensajes,
    this.recaudo,
    this.recargas,
    this.rifas,
    this.anulaciones,
    this.tienda,
    this.enrutamientoCredito,
  });

  factory PermisosDTO.fromJson(Map<String, dynamic> json) {
    return PermisosDTO(
      clientes: List<dynamic>.from(json["clientes"] ?? []),
      venta: List<dynamic>.from(json["venta"] ?? []),
      consultas: List<dynamic>.from(json["consultas"] ?? []),
      mensajes: List<dynamic>.from(json["mensajes"] ?? []),
      recaudo: List<dynamic>.from(json["recaudo"] ?? []),
      recargas: List<dynamic>.from(json["recargas"] ?? []),
      rifas: List<dynamic>.from(json["rifas"] ?? []),
      anulaciones: List<dynamic>.from(json["anulaciones"] ?? []),
      tienda: List<dynamic>.from(json["tienda"] ?? []),
      enrutamientoCredito:
          List<dynamic>.from(json["enrutamiento_credito"] ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
        "clientes": clientes,
        "venta": venta,
        "consultas": consultas,
        "mensajes": mensajes,
        "recaudo": recaudo,
        "recargas": recargas,
        "rifas": rifas,
        "anulaciones": anulaciones,
        "tienda": tienda,
        "enrutamiento_credito": enrutamientoCredito,
      };
}
