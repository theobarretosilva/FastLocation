import 'package:flutter/material.dart';

class ButtonHistory extends StatelessWidget {
  const ButtonHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 45),
                                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ), 
              ),
              child: const Text('Histórico de Endereços', style: TextStyle( color: Color(0xFFFFFFFF)),),
            );
  }
}