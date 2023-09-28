/// Import Flutter
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:listo/app/domain/notifiers/configuracion/configuracion_state_notifier.dart';

/// Import Libraries
import 'package:sizer/sizer.dart';
import 'package:listo/generated/l10n.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

/// Import Routes
import 'package:listo/app/ui/routes/routes.dart';
import 'package:listo/app/ui/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, wild) {
        final state = watch(configuracionStateNotifierProvider);
        return Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              builder: (context, widget) => ResponsiveWrapper.builder(
                  BouncingScrollWrapper.builder(context, widget!),
                  maxWidth: 1200,
                  minWidth: 450,
                  defaultScale: true,
                  breakpoints: [
                    ResponsiveBreakpoint.resize(450, name: MOBILE),
                    ResponsiveBreakpoint.autoScale(800, name: TABLET),
                    ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                    ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                    ResponsiveBreakpoint.autoScale(2460, name: "4K"),
                  ],
                  background: Container(color: Color(0xFFF5F5F5))),
              debugShowCheckedModeBanner: false,
              onGenerateTitle: (BuildContext context) =>
                  S.of(context).tituloAppBar,
              initialRoute: Routes.login,
              routes: appRoutes,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              theme: ThemeData(fontFamily: 'Roboto'),
              locale: Locale(state.configuracion.idioma ?? "es"),
            );
          },
        );
      },
    );
  }
}
