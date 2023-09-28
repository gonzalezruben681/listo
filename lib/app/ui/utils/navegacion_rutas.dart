import 'package:flutter/material.dart';

class NavegacionRutas {
  void redireccionarWidget(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  void redireccionarNombreRutaLimpiar(BuildContext context, String ruta) {
    Navigator.pushNamedAndRemoveUntil(context, ruta, ModalRoute.withName('/'));
  }

  void redireccionarNombreRuta(BuildContext context, String ruta) {
    Navigator.pushNamed(context, ruta);
  }

  void cerrar(BuildContext context) {
    Navigator.pop(context);
  }
}
