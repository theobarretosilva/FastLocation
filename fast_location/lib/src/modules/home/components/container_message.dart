import 'package:flutter/material.dart';

class ContainerMessage extends StatelessWidget {
  const ContainerMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(16),
            child: const Row(
              children: [
                Icon(Icons.compare_arrows, color: Color(0xFF204C22), size: 60,),
                Expanded(
                  child: Text(
                    'Faça uma busca para localizar seu destino',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
  }
}