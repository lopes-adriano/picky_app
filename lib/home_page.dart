/*Classe que define o conjunto de widgets presentes na HomePage do app e algumas funções.
É do tipo Stateful, visto que possui elementos que possuem diferentes estados (botões, por exemplo). */
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picky/custom_button.dart';
import 'package:picky/image_view.dart';
import 'package:picky/styles.dart';
import 'package:unicons/unicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var image;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              //Título do App
              Container(
                padding: const EdgeInsets.only(
                  top: 8.0,
                ),
                child: Text(
                  'Picky',
                  style: kTitleTextStyle,
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                child: Divider(
                  color: Colors.black,
                  thickness: 1.5,
                ),
                width: 100,
              ),
              //Botões
              Spacer(),
              ImageView(file: image),
              Spacer(),
              CustomButton(
                label: 'Câmera',
                icon: UniconsLine.camera,
                onPressed: () {
                  pickImage(ImageSource.camera);
                },
              ),
              CustomButton(
                label: 'Galeria',
                icon: UniconsLine.camera,
                onPressed: () {
                  pickImage(ImageSource.gallery);
                },
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
