/// Import Flutter
import 'package:flutter/material.dart';

/// Import Libraries
import 'package:listo/generated/l10n.dart';

/// Import Widgets
import 'package:listo/app/ui/widgets/atom/animacion_cargando_atom.dart';

class CargandoMolecule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          AnimacionCargandoAtom(),
          Text(
            S.of(context).cargando,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          )
        ]);
  }
}
