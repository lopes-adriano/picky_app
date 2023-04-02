import 'dart:io';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:picky/styles.dart';

class ImageView extends StatelessWidget {
  final File? file;
  const ImageView({super.key, this.file});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          width: 300,
          height: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: (file == null)
                ? GFImageOverlay(
                    height: 200,
                    width: 300,
                    child: Center(
                      child: Text('Escolha uma imagem',style: kImageText,),),
                    image: AssetImage('assets/images/strawberry_img.jpg'),
                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
                  )
                : Image.file(file!, fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}
