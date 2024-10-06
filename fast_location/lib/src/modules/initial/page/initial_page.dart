import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Exibe um indicador de carregamento
      ),
    );
  }
}