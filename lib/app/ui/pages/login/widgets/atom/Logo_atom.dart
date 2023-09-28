// ignore_for_file: file_names

/// Import Flutter
import 'package:flutter/material.dart';

class LogoAtom extends StatelessWidget {
  final String ubicacionImagen;
  final double? escalaImagen;
  final double? heigth;
  final double? width;
  const LogoAtom(
      {Key? key,
      required this.ubicacionImagen,
      this.escalaImagen,
      this.heigth,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ubicacionImagen,
      scale: escalaImagen ?? 4,
      height: heigth,
      width: width,
    );
  }
}
