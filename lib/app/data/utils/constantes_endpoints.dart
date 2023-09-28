abstract class ConstantesEndpoints {
  static const String urlBase = '/api/listomovil/';

  /// Login
  static const String consultarConfiguracion =
      'autenticacion/consultar/configuracion';
  static const String consultarRutas = 'autenticacion/consultar/rutas';
  static const String iniciarSesion = 'autenticacion/iniciar-sesion';
  static const String consultarPermisos = 'usuario/consultar/permisos';

  static List<String> get listaNegra => [
        ConstantesEndpoints.consultarConfiguracion,
        ConstantesEndpoints.consultarRutas,
        ConstantesEndpoints.iniciarSesion,
      ];
}
