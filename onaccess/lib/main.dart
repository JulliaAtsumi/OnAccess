import 'package:flutter/material.dart';
import 'package:onaccess/view/home/home.dart';
import 'package:onaccess/view/splash/splash.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
