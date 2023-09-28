class OpcionDTO {
  const OpcionDTO({
    this.id,
    this.descripcion,
  });

  final dynamic id;
  final String? descripcion;

  factory OpcionDTO.fromJson(Map<String, dynamic> json) => OpcionDTO(
        id: json["id"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
      };
}
