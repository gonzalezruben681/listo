/// Import Flutter
import 'package:flutter/material.dart';

/// Import Templates
import 'package:listo/app/ui/pages/login/template/login_template.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LoginTemplate(),
    );
  }
}
