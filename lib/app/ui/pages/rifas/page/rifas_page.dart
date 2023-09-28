/// Import Flutter
import 'package:flutter/material.dart';

/// Import Template
import 'package:listo/app/ui/pages/rifas/template/rifas_template.dart';

class RifasPage extends StatelessWidget {
  const RifasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RifasTemplate(),
    );
  }
}
