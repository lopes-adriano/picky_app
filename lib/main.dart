import 'dart:io';

import 'package:picky/image_view.dart';
import 'package:picky/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const Picky());
}

class Picky extends StatelessWidget {
  const Picky({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picky',
      theme: ThemeData.light(),
      home: const MyHomePage(title: 'Picky'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? image;

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
              children: [
                ImageView(file: image),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.camera_alt),
                      label: const Text(
                        'Câmera',
                        style: kButtonText,
                      ),
                      onPressed: () {
                        pickImage(ImageSource.camera);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kColorRed,
                        minimumSize: const Size(100, 50),
                      ),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.collections),
                      label: const Text(
                        'Galeria',
                        style: kButtonText,
                      ),
                      onPressed: () {
                        pickImage(ImageSource.gallery);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kColorRed,
                        minimumSize: const Size(100, 50),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
