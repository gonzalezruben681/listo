part of 'configuracion_state_notifier.dart';

class ConfiguracionState extends Equatable {
  final ConfiguracionDTO configuracion = ConfiguracionDTO.fromJson({});

  @override
  get props => [];
}


class ConfiguracionInicial extends ConfiguracionState {
  ConfiguracionInicial();

  @override
  List<Object> get props => [];
}

class SetInicialState extends ConfiguracionState {
  final ConfiguracionDTO configuracionInitial;
  SetInicialState(this.configuracionInitial);

  @override
  get configuracion => configuracionInitial;
}

class ConfigurarClaveState extends ConfiguracionState {}

class CambiarConfiguracionState extends ConfiguracionState {
  final ConfiguracionDTO cambiarConfigucacion;
  CambiarConfiguracionState(this.cambiarConfigucacion);

  @override
  get configuracion => cambiarConfigucacion;
}

class ErrorState extends ConfiguracionState {}

class GuardarConfiguracionState extends ConfiguracionState {
  final ConfiguracionDTO cambiarConfigucacion;
  GuardarConfiguracionState(this.cambiarConfigucacion);

  @override
  get configuracion => cambiarConfigucacion;
}

class CargandoState extends ConfiguracionState {}
