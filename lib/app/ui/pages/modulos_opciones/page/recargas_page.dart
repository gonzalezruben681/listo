/// Import Flutter
import 'package:flutter/material.dart';

/// Import Template
import 'package:listo/app/ui/pages/modulos_opciones/template/modulo_opciones_template.dart';

class ModuloOpcionesPage extends StatelessWidget {
  const ModuloOpcionesPage(this.titulo);

  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ModuloOpcionesTemplate(
        titulo: titulo,
      ),
    );
  }
}
