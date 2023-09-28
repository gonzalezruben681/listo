/// Import Flutter
import 'package:flutter/material.dart';

/// Import Template
import 'package:listo/app/ui/pages/clientes/template/clientes_template.dart';

class ClientesPage extends StatelessWidget {
  const ClientesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClientesTemplate(),
    );
  }
}
