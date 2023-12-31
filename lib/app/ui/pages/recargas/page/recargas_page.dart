/// Import Flutter
import 'package:flutter/material.dart';

/// Import Template
import 'package:listo/app/ui/pages/recargas/template/recargas_template.dart';

class RecargasPage extends StatelessWidget {
  const RecargasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RecargasTemplate(),
    );
  }
}
