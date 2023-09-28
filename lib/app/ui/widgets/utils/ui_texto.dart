/// Import Flutter
import 'package:flutter/material.dart';

/// Import Utils
import 'package:listo/app/ui/utils/constantes_color_tema.dart';

class UiTexto {
  Widget textoTitulo(String texto) {
    return Text(
      texto,
      style: TextStyle(
          fontSize: 18,
          color: Color(ConstantesColorTema.azulLetras),
          fontFamily: 'Roboto-Bold'),
    );
  }

  Widget textoSubTitulo(String texto) {
    return Text(
      texto,
      style: TextStyle(
          fontFamily: 'Roboto-Regular',
          fontSize: 16,
          color: Color(ConstantesColorTema.azulLetras)),
      textAlign: TextAlign.center,
    );
  }

  Widget textoContenido(String texto) {
    return Text(
      texto,
      style: TextStyle(
          fontFamily: 'Roboto-Light',
          fontSize: 14,
          color: Color(ConstantesColorTema.azulLetras)),
      textAlign: TextAlign.center,
    );
  }
}
