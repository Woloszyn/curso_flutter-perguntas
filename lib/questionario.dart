import 'package:curso_perguntas/questao.dart';
import 'package:curso_perguntas/resposta.dart';
import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  List<Widget> widgets = [];
  List<Map<String, Object>> respostas = [];

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  void initialize() {
    if (temPerguntaSelecionada) {
      respostas = perguntas[perguntaSelecionada].cast()['respostas'];
      widgets = respostas
          .map((resp) => Resposta(
                resp['texto'].toString(),
                () => {responder(int.parse(resp['nota'].toString()))},
              ))
          .toList();
    }
  }

  String _pergunta() {
    return perguntas[perguntaSelecionada]['texto'].toString();
  }

  @override
  Widget build(BuildContext context) {
    initialize();
    return Column(
      children: [Questao(_pergunta()), ...widgets],
    );
  }
}
