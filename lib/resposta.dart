import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String textoResposta;
  final void Function() press;

  Resposta(this.textoResposta, this.press);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(onPressed: press, child: Text(textoResposta)),
    );
  }
}
