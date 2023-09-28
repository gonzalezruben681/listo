import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listo/app/domain/notifiers/modulo/modulo_state_notifier.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

/// Import Utils
import 'package:listo/app/ui/utils/constantes_color_tema.dart';

class GraficasWidget extends StatefulWidget {
  GraficasWidget({Key? key}) : super(key: key);

  @override
  _GraficasWidgetState createState() => _GraficasWidgetState();
}

class _GraficasWidgetState extends State<GraficasWidget> {
  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return ProviderListener(
      provider: moduloStateNotifierProvider,
      onChange: (context, state) {
        if (state is ListaPermisosState) {
          if (state.cantidadModulosHome >= 4) {
            context.read(esDesplegar.notifier).state = true;
            _panelController.close();
          } else {
            context.read(esDesplegar.notifier).state = false;
            _panelController.open();
          }
        }
      },
      child: Consumer(
        builder: (BuildContext context, watch, child) {
          final esDeslizar = watch(esDesplegar).state;
          return Container(
            child: SlidingUpPanel(
              maxHeight: sizeScreen.height * 0.48,
              minHeight: sizeScreen.height * 0.33,
              controller: _panelController,
              isDraggable: esDeslizar,
              panelBuilder: (sc) => Container(),
              color: Color(ConstantesColorTema.azulFondos),
              parallaxEnabled: esDeslizar,
              parallaxOffset: 0.5,
            ),
          );
        },
      ),
    );
  }

  /* void desplegarGraficas(int? cantidadModulosHome) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (cantidadModulosHome! >= 4) {
        context.read(esDesplegar.notifier).state = true;
        _panelController.close();
      } else {
        context.read(esDesplegar.notifier).state = false;
        _panelController.open();
      }
    });
  } */
}

final esDesplegar = StateProvider.autoDispose<bool>((ref) => false);
