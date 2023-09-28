/// Import Entities
import 'package:listo/app/domain/entities/utils/opciones_dto.dart';
import 'package:listo/app/domain/entities/login_dto/login_dto.dart';
import 'package:listo/app/domain/entities/login_dto/sesion_dto.dart';
import 'package:listo/app/domain/entities/login_dto/permisos_dto.dart';
import 'package:listo/app/domain/entities/configuracion_dto/configuracion_dto.dart';

abstract class AbstractLoginRepository {
  Future<ConfiguracionDTO> consultarConfiguracion();

  Future<OpcionesDTO> consultarRutas(LoginDto loginDTO);

  Future<SesionDTO> iniciarSesion(LoginDto loginDTO);

  Future<PermisosDTO> consultarPermisos(String codigoUsuario);

  Future<void> logout();
}
