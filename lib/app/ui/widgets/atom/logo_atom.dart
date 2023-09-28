/// Import Flutter
import 'package:flutter/material.dart';

class LogoAtom extends StatelessWidget {
  final double? escalaImagen;
  final double? heigth;
  final double? width;
  const LogoAtom({this.escalaImagen, this.heigth, this.width});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/img/logo_listo.png',
      scale: escalaImagen ?? 4,
      height: heigth,
      width: width,
    );
  }
}
