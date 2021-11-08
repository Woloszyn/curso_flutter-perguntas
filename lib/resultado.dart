import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final double totalNota;
  final void Function() restartApp;

  Resultado(this.totalNota, this.restartApp);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text("O total da sua nota foi de $totalNota",
              style: TextStyle(fontSize: 25)),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(0, 45, 0, 0),
            child: ElevatedButton(
                onPressed: restartApp, child: Text("Reiniciar APP")),
          )
        ],
      ),
    );
  }
}
