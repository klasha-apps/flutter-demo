import 'package:flutter/material.dart';
import 'package:klasha/home_screen/home_screen.dart';
import 'package:klasha/theme.dart';
import 'package:provider/provider.dart';

import 'bloc/cart_block.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartBloc>(
      create: (context) => CartBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Klasha Store',
        theme: theme(),
        home: const HomeScreen(),
      ),
    );
  }
}
