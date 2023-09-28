import 'package:flutter/material.dart';

/// Import Utils
import 'package:listo/app/ui/utils/constantes_color_tema.dart';

class ModuloWidget extends StatelessWidget {
  const ModuloWidget({
    required this.imagen,
    required this.titulo,
    required this.accion,
  });

  final String imagen;
  final String titulo;
  final VoidCallback accion;

  @override
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4), // color de la sombra
                  spreadRadius: 1, // radio de extensión
                  blurRadius: 5, // radio de desenfoque
                  offset: Offset(1, 3),
                )
              ]),
          height: _sizeScreen.height * 0.10,
          width: _sizeScreen.width * 0.25,
          child: MaterialButton(
            onPressed: accion,
            child: Image.asset(
              imagen,
              height: _sizeScreen.height * 0.70,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(titulo,
            style: TextStyle(
                color: Color(ConstantesColorTema.azulLetras),
                fontSize: 16,
                fontWeight: FontWeight.bold))
      ],
    );
  }
}
