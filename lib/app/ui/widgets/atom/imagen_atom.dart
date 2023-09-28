/// Import Fluter
import 'package:flutter/material.dart';

class ImagenAtom extends StatelessWidget {
  final String ubicacionImagen;
  final double? escalaImagen;
  final double? heigth;
  final double? width;
  const ImagenAtom(
      {required this.ubicacionImagen,
      this.escalaImagen,
      this.heigth,
      this.width});

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
