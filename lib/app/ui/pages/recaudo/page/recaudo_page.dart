/// Import Flutter
import 'package:flutter/material.dart';

/// Import Template
import 'package:listo/app/ui/pages/recaudo/template/recaudo_template.dart';

class RecaudoPage extends StatelessWidget {
  const RecaudoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RecargasTemplate(),
    );
  }
}
