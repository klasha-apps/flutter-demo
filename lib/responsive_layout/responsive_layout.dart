import 'package:flutter/material.dart';
import '../constants.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabBody;
  final Widget desktopBody;

  const ResponsiveLayout(
      {Key? key, required this.mobileBody, required this.desktopBody, required this.tabBody})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= desktopWidth) {
          return desktopBody;
        } else if (constraints.maxWidth < desktopWidth && constraints.maxWidth >= tabWidth) {
          return tabBody;
        }else{
          return mobileBody;
        }
      },
    );
  }
}
