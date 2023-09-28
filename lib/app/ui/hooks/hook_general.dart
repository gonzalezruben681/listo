

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useCargarDatos(VoidCallback state) {
  return use(_CargarDatos(state));
}

class _CargarDatos extends Hook<void> {
  const _CargarDatos(this.state);
  final VoidCallback state;

  @override
  __CargarDatosState createState() => __CargarDatosState();
}

class __CargarDatosState extends HookState<void, _CargarDatos> {
  @override
  void initHook() {
    super.initHook();
    Future.delayed(Duration.zero, hook.state);

  }

  @override
  void build(BuildContext context) {}

  @override
  void dispose() {
    super.dispose();
  }
}
