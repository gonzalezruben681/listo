/// Import Flutter
import 'package:flutter/material.dart';

/// Import Libraries
import 'package:listo/generated/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// Import Injections
import 'package:listo/app/injection_controllers/injection_controllers.dart';

/// Import Routes
import 'package:listo/app/ui/routes/routes.dart';
import 'package:listo/app/ui/routes/app_routes.dart';

/// Import Utils
import 'package:responsive_framework/utils/scroll_behavior.dart';

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(configuracionStateControllerProvider);
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
      onGenerateTitle: (BuildContext context) => S.of(context).tituloAppBar,
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
      locale: Locale(state.configuracion.idioma ?? 'es'),
    );
  }
}
