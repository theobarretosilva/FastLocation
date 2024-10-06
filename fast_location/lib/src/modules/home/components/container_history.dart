import 'package:flutter/material.dart';

class ContainerHistory extends StatelessWidget {
  const ContainerHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E0E0),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16),
                child: const SizedBox(
                  child: Row(
                    children: [
                      Icon(Icons.location_off, color: Color(0xFF204C22), size: 45,),
                      Expanded(
                        child: Text(
                          'Não há locais recentes',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
  }
}