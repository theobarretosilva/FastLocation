import 'package:flutter/material.dart';
import '../../../shared/colors/colors.dart';
import 'package:fast_location/src/modules/home/page/home_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();

    // Temporizador para redirecionar para a HomePage após 3 segundos
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = 0.0; // Começa com opacidade 0
            const end = 1.0;   // Termina com opacidade 1
            const curve = Curves.easeIn; // Curva da animação

            var opacityAnimation = Tween(begin: begin, end: end).animate(CurvedAnimation(
              parent: animation,
              curve: curve,
            ));

            return FadeTransition(
              opacity: opacityAnimation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              "FastLocation",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.tertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}