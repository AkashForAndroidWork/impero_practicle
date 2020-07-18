import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:impero_practicle/res/style_resources.dart';
import 'package:impero_practicle/screens/welcome_screen.dart';
import 'package:impero_practicle/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(ImperoPracticalApp());
}

class ImperoPracticalApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: WelcomeScreen(),
    );
  }
}