/// Import Libraries
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Import Entities
import 'package:listo/app/domain/entities/generic_dto.dart';
import 'package:listo/app/domain/entities/login_dto/permisos_dto.dart';

/// Import Repositories
import 'package:listo/app/domain/repositories/modulo_repository/abstract_modulo_repository.dart';

/// Import Utils
import 'package:listo/app/data/utils/constantes_endpoints.dart';
import 'package:listo/app/data/utils/http.dart';

class ModuloRepositoryImpl extends AbstractModuloRepository {
  final secureStorage = FlutterSecureStorage();

  @override
  Future<PermisosDTO> consultarPermisos() async {
    try {
      final String codigoUsuario =
          await secureStorage.read(key: 'codigoUsuario') ?? "";

      final Object? respuesta = await HttpService(
        endPoint: ConstantesEndpoints.consultarPermisos + "/" + codigoUsuario,
        token: await secureStorage.read(key: 'tokenSesion'),
      ).getHttp();

      PermisosDTO permisos =
          PermisosDTO.fromJson(GenericoDTO().jsonStringify(respuesta));

      return permisos;
    } catch (_) {
      rethrow;
    }
  }
}
