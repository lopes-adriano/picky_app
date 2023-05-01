import 'package:flutter/material.dart';
import 'package:picky/styles.dart';

/*Classe para criar um botão customizado na tela: 
recebe como parâmetros a fonte da imagem a ser recebida pela função pickImage(),
o texto do botão e o seu ícone*/

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.label, required this.icon, this.onPressed, this.backgroundColor});

  final String label;
  final IconData icon;
  final backgroundColor;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        label: Text(
          label,
          style: kButtonText,
        ),
        icon: Icon(icon),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor != null ? backgroundColor : Color(0xFF202020),
            minimumSize: const Size(200, 40),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
      ),
    );
  }
}
