/// Import Flutter
import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget smallMobile;
  final Widget mobile;
  final Widget bigMobile;
  final Widget tablet;
  final Widget? desktop;

  const ResponsiveWidget(
      {Key? key,
      required this.smallMobile,
      required this.mobile,
      required this.bigMobile,
      required this.tablet,
      this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        print(constraints.maxHeight);
        if (constraints.maxHeight <= 640) {
          return smallMobile;
        } else if (constraints.maxHeight >= 641 &&
            constraints.maxHeight <= 780) {
          return mobile;
        } else if (constraints.maxHeight >= 781 &&
            constraints.maxHeight <= 1080) {
          return bigMobile;
        } else if ((constraints.maxWidth >= 1081 &&
                constraints.maxWidth <= 1125) ||
            desktop == null) {
          return tablet;
        } else {
          return desktop!;
        }
      },
    );
  }
}
