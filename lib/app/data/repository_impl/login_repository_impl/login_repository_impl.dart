/// Import Entities
import 'package:listo/app/domain/entities/generic_dto.dart';
import 'package:listo/app/domain/entities/utils/opciones_dto.dart';
import 'package:listo/app/domain/entities/login_dto/login_dto.dart';
import 'package:listo/app/domain/entities/login_dto/sesion_dto.dart';
import 'package:listo/app/domain/entities/login_dto/permisos_dto.dart';
import 'package:listo/app/domain/entities/configuracion_dto/configuracion_dto.dart';

/// Import Abstracts
import 'package:listo/app/domain/repositories/login_repository/abstract_login_repository.dart';

/// Import Utils
import 'package:listo/app/data/utils/http.dart';
import 'package:listo/app/data/utils/constantes_endpoints.dart';

class LoginRepositoryImpl extends AbstractLoginRepository {
  @override
  Future<ConfiguracionDTO> consultarConfiguracion() async {
    try {
      final Object? respuesta = await HttpService(
        ConstantesEndpoints.consultarConfiguracion,
      ).getHttp();

      final listaMap = GenericoDTO().jsonStringify(respuesta);

      final configuracion = ConfiguracionDTO.fromJson(listaMap);

      return configuracion;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<OpcionesDTO> consultarRutas(LoginDto loginDTO) async {
    try {
      final Object? respuesta = await HttpService(
        ConstantesEndpoints.consultarRutas,
      ).postHttp(loginDTO.toJson());

      final listaRutas =
          OpcionesDTO.fromJson(GenericoDTO().jsonStringify(respuesta));
      return listaRutas;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<SesionDTO> iniciarSesion(LoginDto loginDTO) async {
    try {
      final Object? respuesta = await HttpService(
        ConstantesEndpoints.iniciarSesion,
      ).postHttp(loginDTO.toJson());

      SesionDTO sesion =
          SesionDTO.fromJson(GenericoDTO().jsonStringify(respuesta));

      return sesion;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<PermisosDTO> consultarPermisos(String codigoUsuario) async {
    try {
      final Object? respuesta = await HttpService(
        ConstantesEndpoints.consultarPermisos + "/" + codigoUsuario,
      ).getHttp();

      PermisosDTO permisos =
          PermisosDTO.fromJson(GenericoDTO().jsonStringify(respuesta));

      return permisos;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {}
}
