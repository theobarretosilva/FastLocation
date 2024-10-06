import 'package:fast_location/src/modules/home/page/home_page.dart';
import 'package:flutter/material.dart';
import 'src/routes/app_routes.dart';
import 'src/modules/initial/page/initial_page.dart';
import 'src/modules/home/page/home_page.dart';
import 'src/modules/history/page/history_page.dart';
import 'src/modules/home/components/resultado_consulta.dart';

void main() {
  runApp(Directionality(
    textDirection: TextDirection.ltr,
    child: AppWidget(),
    // child: ResultadoConsulta()
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
      initialRoute: AppRoutes.initial, 
      routes: {
        AppRoutes.initial: (context) => InitialPage(),
        AppRoutes.home: (context) => HomePage(),
        AppRoutes.history: (context) => HistoryPage(),
      },
    );
  }
}
