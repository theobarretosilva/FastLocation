import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../controller/history_controller.dart';

class HistoryPage extends StatelessWidget {
  final HistoryController controller = HistoryController();

  @override
  Widget build(BuildContext context) {
    controller.loadHistory();

    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico'),
      ),
      body: Observer(
        builder: (_) {
          if (controller.history.isEmpty) {
            return Center(
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
          controller.addHistoryItem('Novo item ${controller.history.length + 1}');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}