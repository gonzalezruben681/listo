/// Import Flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Import Libraries
import 'package:sizer/sizer.dart';

/// Import Utils
import 'package:listo/app/ui/utils/constantes_color_tema.dart';

class UiBoton {
  final String texto;
  final VoidCallback accion;
  final String? anchoBoton;
  const UiBoton({
    required this.texto,
    required this.accion,
    this.anchoBoton,
  });

  double selecionarAnchoBoton(anchoBoton) {
    double tamanio = 1;
    switch (anchoBoton) {

      /// Tamaño boton formulario
      case "sm":
        tamanio = 35;
        break;

      /// Tamaño boton modal
      case "md":
        tamanio = 50;
        break;

      /// Tamaño boton largo
      case "lg":
        tamanio = 72;
        break;
    }

    return tamanio;
  }

  Widget botonPrimario() {
    return MaterialButton(
      color: Color(
          ConstantesColorTema.azulLetras), // Color.fromRGBO(16, 73, 99, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      minWidth: selecionarAnchoBoton(anchoBoton).w,
      padding: EdgeInsets.all(10),
      onPressed: () => accion(),
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
      ),
      textColor: Colors.white,
    );
  }

  Widget botonSecundario() {
    return MaterialButton(
      color: Color(ConstantesColorTema.blanco),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(color: Color.fromRGBO(51, 106, 149, 1)),
      ),
      minWidth: selecionarAnchoBoton(anchoBoton).w,
      padding: EdgeInsets.all(10),
      onPressed: () => accion(),
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Color(ConstantesColorTema.azulFondos)),
      ),
      textColor: Colors.white,
    );
  }

  Widget botonTexto(child) {
    return TextButton(
        onPressed: accion,
        child: child,
        style: TextButton.styleFrom(
          alignment: Alignment.bottomCenter,
        ));
  }
}
