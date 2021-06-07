import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jokenpo/JogoAppBar.dart';
import 'package:jokenpo/JogoRodape.dart';

import 'JogoBody.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JogoAppBar(),
      body: JogoBody(),
      bottomNavigationBar: Rodape(),
    );
  }
}