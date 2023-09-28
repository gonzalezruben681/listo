/// Import Flutter
import 'package:flutter/widgets.dart' show Widget, BuildContext;

/// Import Pages
import 'package:listo/app/ui/pages/home/page/home_page.dart';
import 'package:listo/app/ui/pages/login/page/login_page.dart';

/// Import Routes
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.login: (_) => LoginPage(),
      Routes.home: (_) => HomePage(),
    };
