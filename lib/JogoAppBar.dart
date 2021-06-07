import 'package:flutter/material.dart';

class JogoAppBar extends StatelessWidget implements PreferredSizeWidget{
  //const JogoAppBar({Key key}) : super(key: key);
  final _title = 'Jonkenpo';

  @override

  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_title),
      backgroundColor: Colors.blue,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}