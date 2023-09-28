part of 'configuracion_bloc.dart';

abstract class ConfiguracionEvent extends Equatable {}

class ConfiguracionInicial extends ConfiguracionEvent {
  ConfiguracionInicial();

  @override
  List<Object> get props => [];
}

class ConfigurarClave extends ConfiguracionEvent {
  final int claveDia;
  ConfigurarClave({required this.claveDia});

  @override
  List<Object> get props => [claveDia];
}

class GuardarConfiguracion extends ConfiguracionEvent {
  final ConfiguracionDTO configuracion;
  GuardarConfiguracion({required this.configuracion});

  @override
  List<Object> get props => [configuracion];
}
