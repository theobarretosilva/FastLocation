import 'package:flutter/material.dart';
import 'src/routes/app_routes.dart';
import 'src/modules/initial/page/initial_page.dart';
import 'src/modules/home/page/home_page.dart';
import 'src/modules/history/page/history_page.dart';
import 'src/modules/home/components/resultado_consulta.dart';
import 'src/modules/home/components/latest_locations.dart';

void main() {
  runApp(Directionality(
    textDirection: TextDirection.ltr,
    child: AppWidget(),
    // child: LatestLocations()
  ));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

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
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.history: (context) => HistoryPage(),
      },
    );
  }
}
