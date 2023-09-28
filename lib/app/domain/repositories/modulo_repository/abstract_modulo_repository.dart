/// Import Entities
import 'package:listo/app/domain/entities/login_dto/permisos_dto.dart';

abstract class AbstractModuloRepository {
  Future<PermisosDTO> consultarPermisos();
}
