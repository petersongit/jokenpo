import 'package:flutter/material.dart';

class Rodape extends StatelessWidget {
  const Rodape({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue,
      child: Padding(
        padding: EdgeInsets.all(16),
      ),
    );
  }
}
