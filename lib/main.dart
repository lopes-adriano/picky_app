import 'package:picky/splash.dart';
import 'package:flutter/material.dart';

//Cheque o arquivo pubspec.yaml para entender um pouco sobre as bibliotecas utilizadas

void main() {
  runApp(const Picky());
}

class Picky extends StatelessWidget {
  const Picky({super.key});

  // Widget raíz do app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Picky',
      theme: ThemeData.light(),
      home: SplashScreen(title: 'Picky'),
      //SplashScreen é a animação que ocorre ao abrir o app definida no arquivo splash.dart
      //Caso não vá utilizar uma SplashScreen, defina como 'home' o widget da homepage do seu app
    );
  }
}
