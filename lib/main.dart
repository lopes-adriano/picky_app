import 'dart:io';

import 'package:picky/image_view.dart';
import 'package:picky/splash.dart';
import 'package:picky/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unicons/unicons.dart';

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
      print('Erro: $e');
    }
  }

/*Função para criar um botão na tela: 
recebe como parâmetros a fonte da imagem a ser recebida pela função pickImage(),
o texto do botão e o seu ícone*/
  Widget _buildButton(ImageSource source, String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        label: Text(
          label,
          style: kButtonText,
        ),
        icon: Icon(icon),
        onPressed: () {
          pickImage(source);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87,
            minimumSize: const Size(200, 40),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
    
            children: [
              //Título do App
              Container(
                padding: const EdgeInsets.only(top:12,),
                child: Text('Picky',style: kTitleTextStyle,),
              ),
              Container(
                child: Divider(color: Colors.black,thickness: 1.5,),
                width: 100,
              ),
              
              //Botões
              Container(
                padding: EdgeInsets.symmetric(vertical:50),
                child: ImageView(file: image)),
              _buildButton(ImageSource.camera, 'Câmera', UniconsLine.camera),
              _buildButton(ImageSource.gallery, 'Galeria', UniconsLine.images),
            ],
          ),
        ),
      ),
    );
  }
}
