import 'dart:io';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:picky/styles.dart';

class ImageView extends StatelessWidget {
  final File? file;
  const ImageView({super.key, this.file});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: (file == null)
            ? GFImageOverlay(
                height: 300,
                width: 300,
                child: Center(
                  child: Text('Escolha uma imagem',style: kImageText,),),
                image: AssetImage('assets/images/strawberry_img.jpg'),
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
              )
            : Image.file(file!, fit: BoxFit.cover),
      ),
    );
  }
}
