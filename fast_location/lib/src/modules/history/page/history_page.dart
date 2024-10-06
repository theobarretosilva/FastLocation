import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../controller/history_controller.dart';

class HistoryPage extends StatelessWidget {
  final HistoryController controller = HistoryController();

  HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Carrega o histórico automaticamente quando a página é acessada
    controller.loadHistory();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico'),
      ),
      body: Observer(
        builder: (_) {
          if (controller.history.isEmpty) {
            return const Center(
              child: Text('Nenhum histórico disponível'),
            );
          }

          return ListView.builder(
            itemCount: controller.history.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.history[index]),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Exemplo de adicionar um item ao histórico
          controller.addHistoryItem('Novo item ${controller.history.length + 1}');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
