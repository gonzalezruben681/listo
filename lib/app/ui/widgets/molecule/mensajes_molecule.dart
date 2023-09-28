/// Import Flutter
import 'package:flutter/material.dart';

/// Import Widgets
import 'package:listo/app/ui/widgets/utils/ui_texto.dart';

/// Import Utils
import 'package:listo/app/ui/utils/constantes_color_tema.dart';

class MensajesMolecule extends StatelessWidget {
  final Widget? icon;
  final String? tituloMensaje;
  final String? mensaje;
  final String? recomendacion;
  final Widget? botones;

  const MensajesMolecule({
    this.icon,
    this.tituloMensaje,
    this.mensaje,
    this.recomendacion,
    this.botones,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 25, top: 15),
        child: Container(
          child: Column(
            children: [
              icon!,
              UiTexto().textoTitulo(tituloMensaje!),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Color(ConstantesColorTema.azulFondos),
                height: 10,
                thickness: 10.0,
              ),
              SizedBox(
                height: 30,
              ),
              UiTexto().textoSubTitulo('$mensaje \n ${recomendacion ?? ''}'),
              SizedBox(
                height: 30,
              ),
              Container(child: botones)
            ],
          ),
        ),
      ),
    );
  }
}
