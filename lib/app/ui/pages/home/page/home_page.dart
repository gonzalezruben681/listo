/// Import Flutter
import 'package:flutter/material.dart';

/// Import Template
import 'package:listo/app/ui/pages/home/template/home_template.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HomeTemplate(),
    );
  }
}
