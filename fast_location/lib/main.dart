import 'package:flutter/material.dart';
import 'src/routes/app_routes.dart';
import 'src/modules/initial/page/initial_page.dart';
import 'src/modules/home/page/home_page.dart';
import 'src/modules/history/page/history_page.dart';
import 'src/modules/home/components/resultado_consulta.dart';

void main() {
  runApp(Directionality(
    textDirection: TextDirection.ltr, // Defina a direção do texto
    child: ResultadoConsulta(),
  ));
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastLocation',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // Inicialização do aplicativo na página inicial
      initialRoute: AppRoutes.initial, 
      routes: {
        // Definindo as rotas nomeadas
        AppRoutes.initial: (context) => InitialPage(),
        AppRoutes.home: (context) => HomePage(),
        AppRoutes.history: (context) => HistoryPage(),
      },
    );
  }
}
