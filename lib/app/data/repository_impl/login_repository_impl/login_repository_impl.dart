/// Import Libraries
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Import Entities
import 'package:listo/app/domain/entities/generic_dto.dart';
import 'package:listo/app/domain/entities/login_dto/login_dto.dart';
import 'package:listo/app/domain/entities/utils/opciones_dto.dart';
import 'package:listo/app/domain/entities/login_dto/sesion_dto.dart';
import 'package:listo/app/domain/entities/configuracion_dto/configuracion_dto.dart';

/// Import Respositories
import 'package:listo/app/domain/repositories/login_repository/abstract_login_repository.dart';

/// Import Utils
import 'package:listo/app/data/utils/http.dart';
import 'package:listo/app/data/utils/constantes_endpoints.dart';

class LoginRepositoryImpl extends AbstractLoginRepository {
  final secureStorage = FlutterSecureStorage();

  @override
  Future<ConfiguracionDTO> consultarConfiguracion() async {
    try {
      final Object? respuesta = await HttpService(
        endPoint: ConstantesEndpoints.consultarConfiguracion,
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
        endPoint: ConstantesEndpoints.consultarRutas,
        body: loginDTO.toJson(),
      ).postHttp();

      final listaRutas =
          OpcionesDTO.fromJson(GenericoDTO().jsonStringify(respuesta));
      return listaRutas;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<SesionDTO> login(LoginDto loginDTO) async {
    try {
      final Object? respuesta = await HttpService(
        endPoint: ConstantesEndpoints.login,
        body: loginDTO.toJson(),
      ).postHttp();

      SesionDTO sesion =
          SesionDTO.fromJson(GenericoDTO().jsonStringify(respuesta));

      await secureStorage.write(key: 'tokenSesion', value: sesion.token);
      await secureStorage.write(
          key: 'codigoUsuario', value: sesion.codigoUsuario.toString());

      return sesion;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await secureStorage.delete(key: 'tokenSesion');
    await secureStorage.delete(key: 'codigoUsuario');
  }
}
