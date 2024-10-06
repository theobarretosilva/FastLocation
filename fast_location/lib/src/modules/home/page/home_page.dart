import 'package:fast_location/src/modules/home/components/button_history.dart';
import 'package:fast_location/src/modules/home/components/button_search.dart';
import 'package:fast_location/src/modules/home/components/container_history.dart';
import 'package:fast_location/src/modules/home/components/container_message.dart';
import 'package:fast_location/src/modules/home/components/logo_box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            LogoBox(),
            SizedBox(height: 20),
            ContainerMessage(),
            SizedBox(height: 20),
            ButtonSearch(),
            SizedBox(height: 20),

            Row(
              children: [
                Icon(Icons.place, color: Color(0xFF204C22), size: 30,),
                SizedBox(width: 16),
                Text(
                  'Últimos endereços localizados',
                  style: TextStyle(fontSize: 16, color: Color(0xFF204C22)),
                ),
              ],
            ),
            
            SizedBox(height: 20),
            ContainerHistory(),
            SizedBox(height: 20),
            ButtonHistory(),
          ],
        ),
      ),

      // 7. Enviar para rota (Menu Inferior)
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFFE0E0E0),
        child: SizedBox(
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 32), // Espaço para manter a simetria
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(Icons.alt_route_rounded, color: Colors.white,),
              ),
              const SizedBox(width: 32), // Espaço para manter a simetria
            ],
          ),
        ),
      ),
    );
  }
}