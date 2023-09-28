/// Import Flutter
import 'package:flutter/material.dart';

class BotonRedesSocialesAtom extends StatelessWidget {
  final Widget? icono;
  final VoidCallback accion;
  final Color? color;
  const BotonRedesSocialesAtom({
    Key? key,
    this.icono,
    required this.accion,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 30,
        height: 30,
        child: MaterialButton(
          onPressed: () => accion(),
          color: color ?? Colors.white,
          textColor: Color(0xFF346c94),
          child: icono,
          padding: EdgeInsets.all(5),
          shape: CircleBorder(),
        ));
  }
}
