/// Import Libraries
import 'package:listo/generated/l10n.dart';

/// Import Entities
import 'package:listo/app/domain/entities/utils/error_dto.dart';

class ErrorGeneral {
  ErrorDto errorConfiguracion() {
    return ErrorDto(
      codigo: '0',
      mensaje: S().errorConfiguracionVacia,
      recomendacion: S().recomendacionConfiguracionVacia,
    );
  }

  ErrorDto errorNavegacion() {
    return ErrorDto(
      codigo: '0',
      mensaje: S().errorNavegacion,
      recomendacion: S().recomendacionErrorNavegacion,
    );
  }

  ErrorDto errorTimeOut() {
    return ErrorDto(
      codigo: '0',
      mensaje: S().errorTimeOut,
      recomendacion: S().recomendacionComuniqueseConAdm,
    );
  }

  ErrorDto errorNoControlado() {
    return ErrorDto(
      codigo: '0',
      mensaje: S().errorNoControlado,
      recomendacion: S().recomendacionComuniqueseConAdm,
    );
  }
}
