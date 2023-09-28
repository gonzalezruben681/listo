/// Import Entities
import 'package:listo/app/domain/entities/utils/opcion_dto.dart';

class OpcionesDTO {
  String titulo;
  List<OpcionDTO> opciones;

  OpcionesDTO({
    required this.titulo,
    required this.opciones,
  });

  factory OpcionesDTO.fromJson(Map<String, dynamic> json) {
    final temporalSelect = json["opciones"] as List<dynamic>;
    return OpcionesDTO(
      titulo: json["titulo"],
      opciones:
          temporalSelect.map((select) => OpcionDTO.fromJson(select)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "opciones": opciones,
      };
}
