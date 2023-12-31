/// Import Flutter
import 'package:flutter/material.dart';

class AlertaAtom {
  final Widget child;

  AlertaAtom(this.child);

  void cargando(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(child: child);
      },
    );
  }
}
