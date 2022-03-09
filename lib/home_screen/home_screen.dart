import 'package:flutter/material.dart';
import 'package:klasha/desktop/desktop.dart';
import 'package:klasha/mobile/mobile.dart';
import 'package:klasha/tab/tab.dart';

import '../responsive_layout/responsive_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileScreen(),
        desktopBody: DesktopScreen(),
        tabBody: TabScreen(),
      ),
    );
  }
}
