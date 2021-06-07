import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jokenpo/Opcao.dart';
import 'package:jokenpo/Vencedor.dart';

class JogoBody extends StatefulWidget {
  const JogoBody({Key key}) : super(key: key);

  @override
  _JogoBodyState createState() => _JogoBodyState();
}

class _JogoBodyState extends State<JogoBody> {
  var _imagemApp = 'images/padrao.png';
  var _fraseResposta = '';
  var _vencedor;

  // var _imagemApp =  Image.asset('images/padrao.png');
  // Usando desta dorma basta atribuir o valor o contrutor do image diretamente

  Opcao _processarEscolhaDoApp() {
    var valores = Opcao.values;
    var indice = Random().nextInt(3);
    return valores[indice];
  }

  void _processar(Opcao escolhaUsuario) {
    Opcao escolhaApp;

    escolhaApp = this._processarEscolhaDoApp();
    _mostrarEscolhaDoApp(escolhaApp);
    _processarResultado(escolhaUsuario, escolhaApp);
    _informarGanhador();
  }

  void _informarGanhador() {
    switch (_vencedor) {
      case Vencedor.USUARIO:
        this._fraseResposta = 'Você ganhou';
        break;
      case Vencedor.APP:
        this._fraseResposta = 'Você perdeu';
        break;
      case Vencedor.EMPATE:
        this._fraseResposta = 'Empatou';
    }
  }

  void _processarResultado(Opcao escolhaUsuario, Opcao escolhaApp) {
    if ((escolhaUsuario == Opcao.PAPEL && escolhaApp == Opcao.PEDRA) ||
        (escolhaUsuario == Opcao.TESOURA && escolhaApp == Opcao.PAPEL) ||
        (escolhaUsuario == Opcao.PEDRA && escolhaApp == Opcao.TESOURA)) {
      _vencedor = Vencedor.USUARIO;
    } else if ((escolhaApp == Opcao.PAPEL && escolhaUsuario == Opcao.PEDRA) ||
        (escolhaApp == Opcao.TESOURA && escolhaUsuario == Opcao.PAPEL) ||
        (escolhaApp == Opcao.PEDRA && escolhaUsuario == Opcao.TESOURA)) {
        _vencedor = Vencedor.APP;
    } else {
        _vencedor = Vencedor.EMPATE;
    }
  }

  void _mostrarEscolhaDoApp(Opcao escolhaApp) {
    switch (escolhaApp) {
      case Opcao.PAPEL:
        setState(() {
          _imagemApp = 'images/papel.png';
        });
        break;
      case Opcao.PEDRA:
        setState(() {
          _imagemApp = 'images/pedra.png';
        });
        break;
      case Opcao.TESOURA:
        setState(() {
          _imagemApp = 'images/tesoura.png';
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do App',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: Image.asset(_imagemApp),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              'Escolha uma opção abaixo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Image.asset('images/papel.png', height: 100),
                onTap: () {
                  _processar(Opcao.PAPEL);
                },
              ),
              GestureDetector(
                child: Image.asset('images/pedra.png', height: 100),
                onTap: () {
                  _processar(Opcao.PEDRA);
                },
              ),
              GestureDetector(
                  child: Image.asset('images/tesoura.png', height: 100),
                  onTap: () {
                    _processar(Opcao.TESOURA);
                  }),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 150),
            child: Text(
              _fraseResposta,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
