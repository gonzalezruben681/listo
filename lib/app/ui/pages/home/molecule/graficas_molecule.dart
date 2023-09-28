// Import Flutter
import 'package:flutter/material.dart';

/// Import Libraries
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

/// Import Injections
import 'package:listo/app/injection_controllers/injection_controllers.dart';

/// Import Controllers
import 'package:listo/app/domain/controllers/modulo/modulo_state_controller.dart';

/// Import Utils
import 'package:listo/app/ui/widgets/utils/responsive.dart';
import 'package:listo/app/ui/utils/constantes_color_tema.dart';

/// Import Hooks
import 'package:listo/app/ui/hooks/hook_general.dart';

final esDesplegable = StateProvider<bool>((ref) => false);

class GraficasWidget extends HookWidget {
  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    useCargarDatos(() => context
        .read(moduloStateNotifierProvider.notifier)
        .consultarPermisosLocal());

    final sizeScreen = MediaQuery.of(context).size;
    final _esDesplegable = useProvider(esDesplegable).state;

    return ProviderListener(
        provider: moduloStateNotifierProvider,
        onChange: (context, state) {
          if (state is ListaPermisosState) {
            if (state.cantidadModulosHome >= 4) {
              context.read(esDesplegable.notifier).state = true;
              _panelController.close();
            } else {
              context.read(esDesplegable.notifier).state = false;
              _panelController.open();
            }
          }
        },
        child: ResponsiveWidget(
          smallMobile: SlidingUpPanel(
            maxHeight: sizeScreen.height * 0.50,
            minHeight: sizeScreen.height * 0.30,
            controller: _panelController,
            isDraggable: _esDesplegable,
            panelBuilder: (sc) => Container(),
            color: Color(ConstantesColorTema.azulFondos),
            parallaxEnabled: true,
            parallaxOffset: 0.5,
          ),
          mobile: SlidingUpPanel(
            maxHeight: sizeScreen.height * 0.52,
            minHeight: sizeScreen.height * 0.37,
            controller: _panelController,
            isDraggable: _esDesplegable,
            panelBuilder: (sc) => Container(),
            color: Color(ConstantesColorTema.azulFondos),
            parallaxEnabled: true,
            parallaxOffset: 0.5,
          ),
          bigMobile: SlidingUpPanel(
            maxHeight: sizeScreen.height * 0.51,
            minHeight: sizeScreen.height * 0.37,
            controller: _panelController,
            isDraggable: _esDesplegable,
            panelBuilder: (sc) => Container(),
            color: Color(ConstantesColorTema.azulFondos),
            parallaxEnabled: true,
            parallaxOffset: 0.5,
          ),
          tablet: SlidingUpPanel(
            maxHeight: sizeScreen.height * 0.50,
            minHeight: sizeScreen.height * 0.34,
            controller: _panelController,
            isDraggable: _esDesplegable,
            panelBuilder: (sc) => Container(),
            color: Color(ConstantesColorTema.azulFondos),
            parallaxEnabled: true,
            parallaxOffset: 0.5,
          ),
        ));
  }
}
