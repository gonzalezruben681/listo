part of 'modulo_bloc.dart';

abstract class ModuloEvent {}

class ConsultarPermisosLocal extends ModuloEvent {}

class ConsultarPermisos extends ModuloEvent {
  ConsultarPermisos();
}
