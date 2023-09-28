/// Import Flutter
import 'package:flutter/material.dart';

/// Import Template
import 'package:listo/app/ui/pages/clientes/template/clientes_template.dart';

class ClientesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClientesTemplate(),
    );
  }
}
