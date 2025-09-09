import 'package:flutter/material.dart';
import 'package:pet_application_flutter/pages/home_screen.dart';

void main(){
  runApp(MaterialApp(home: HomeScreen()));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}