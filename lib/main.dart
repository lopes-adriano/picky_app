import 'dart:io';

import 'package:picky/image_view.dart';
import 'package:picky/splash.dart';
import 'package:picky/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const Picky());
}

class Picky extends StatelessWidget {
  const Picky({super.key});

  // Widget raíz do app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picky',
      theme: ThemeData.light(),
      home: SplashScreen(title: 'Picky'),
      //SplashScreen é a animação que ocorre ao abrir o app definida no arquivo splash.dart
      //Caso não vá utilizar uma SplashScreen, defina como 'home' o widget da homepage do seu app
    );
  }
}

/*Classe que define o conjunto de widgets presentes na HomePage do app e algumas funções.
É do tipo Stateful, visto que possui elementos que possuem diferentes estados (botões, por exemplo). */
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? image;

//Função para obter uma imagem de uma fonte (da câmera ou galeria)
  Future pickImage(source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
  }

/*Função para criar um botão na tela: 
recebe como parâmetros a fonte da imagem a ser recebida pela função pickImage()
e o texto do botão*/
  Widget _buildButton(ImageSource source, String label) {
    return ElevatedButton.icon(
      label: Text(label),
      icon: const FaIcon(FontAwesomeIcons.images),
      onPressed: () {
        pickImage(source);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: kColorMetal,
          // minimumSize: const Size(100, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Picky",
          style: kTitleTextStyle,
        )),
        backgroundColor: kColorRed,
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageView(file: image),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton(ImageSource.camera, 'Câmera'),
                  _buildButton(ImageSource.gallery, 'Galeria'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
