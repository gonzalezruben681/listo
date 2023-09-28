part of 'configuracion_state_controller.dart';

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

class ConfiguracionInicialState extends ConfiguracionState {
  final ConfiguracionDTO configuracionInitial;
  ConfiguracionInicialState(this.configuracionInitial);

  @override
  get configuracion => configuracionInitial;

  @override
  List<Object?> get props => [configuracionInitial];
}

class ConfiguracionActualizarState extends ConfiguracionState {
  final ConfiguracionDTO cambiarConfigucacion;
  ConfiguracionActualizarState(this.cambiarConfigucacion);

  @override
  get configuracion => cambiarConfigucacion;

  @override
  List<Object?> get props => [cambiarConfigucacion];
}

class ConfiguracionGuardarState extends ConfiguracionState {
  final ConfiguracionDTO cambiarConfigucacion;
  ConfiguracionGuardarState(this.cambiarConfigucacion);

  @override
  get configuracion => cambiarConfigucacion;

  @override
  List<Object?> get props => [cambiarConfigucacion];
}

class ConfiguracionCargandoState extends ConfiguracionState {
  @override
  List<Object?> get props => [];
}

class ConfiguracionErrorState extends ConfiguracionState {
  @override
  List<Object?> get props => [];
}

