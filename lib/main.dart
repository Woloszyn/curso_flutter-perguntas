import 'package:curso_perguntas/resposta.dart';
import 'package:flutter/material.dart';
import './questao.dart';
import './resultado.dart';
import './questionario.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  int perguntaSelecionada = 0;
  int totalNota = 0;

  void _chooseAnswer(int nota) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        totalNota += nota;
      });
    }
  }

  void _restartApplication() {
    setState(() {
      perguntaSelecionada = 0;
      totalNota = 0;
    });
  }

  final String olaMundo = "PerguntasApp";

  final List<Map<String, Object>> perguntas = [
    {
      'texto': "Qual é sua cor favorita?",
      'respostas': [
        {'texto': 'Amarelo', 'nota': 2},
        {'texto': 'Azul', 'nota': 0},
        {'texto': 'Vermelho', 'nota': 10},
        {'texto': 'Preto', 'nota': 7},
      ]
    },
    {
      'texto': "Qual é seu animal favorito?",
      'respostas': [
        {'texto': 'Cachorro', 'nota': 10},
        {'texto': 'Gato', 'nota': 0},
        {'texto': 'Tamanduá', 'nota': 5},
        {'texto': 'Mamaco', 'nota': 8},
      ]
    },
    {
      'texto': "Qual é seu hobby favorito?",
      'respostas': [
        {'texto': 'Futebol', 'nota': 9},
        {'texto': 'Carpintaria', 'nota': 4},
        {'texto': 'Jogar Bocha', 'nota': 10},
        {'texto': 'Pintar bolacha', 'nota': 2},
        {'texto': 'Jogar truco', 'nota': 7},
      ]
    },
    {
      'texto': "Qual é sua comida favorita?",
      'respostas': [
        {'texto': 'Pizza', 'nota': 9},
        {'texto': 'Hamburguer', 'nota': 8},
        {'texto': 'Macarrão', 'nota': 10},
        {'texto': 'Salada', 'nota': 1},
      ]
    },
    {
      'texto': "Qual é seu jogo favorito?",
      'respostas': [
        {'texto': 'Fable Aniversary', 'nota': 10},
        {'texto': 'Fifa', 'nota': 7},
        {'texto': 'GTA V', 'nota': 2},
        {'texto': 'PES', 'nota': 1},
      ]
    }
  ];

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(olaMundo),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: perguntas,
                perguntaSelecionada: perguntaSelecionada,
                responder: _chooseAnswer,
              )
            : Resultado(totalNota / perguntas.length, _restartApplication),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() {
    return _PerguntaAppState();
  }
}
