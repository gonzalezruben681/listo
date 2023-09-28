/// Import Flutter
import 'package:flutter/material.dart';

class FondoWidget extends StatelessWidget {
  final String ubicacionImagen;

  FondoWidget(this.ubicacionImagen);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(ubicacionImagen),
        fit: BoxFit.cover,
      )),
    );
  }
}
