/// Import Flutter
import 'package:flutter/material.dart';

class TarjetaWidget extends StatelessWidget {
  const TarjetaWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 10,
      child: child,
    );
  }
}
