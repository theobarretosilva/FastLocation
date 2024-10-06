import 'package:flutter/material.dart';

class LogoBox extends StatelessWidget {
  const LogoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              height: 100,
              child: Center(
                child: 
                Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                    height: 100,
                  ),
              ),
            );
  }
}