import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../controller/history_controller.dart';
import 'package:fast_location/src/modules/home/model/endereco_model.dart';

class HistoryPage extends StatelessWidget {
  final HistoryController controller = HistoryController();

  HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              final endereco = controller.history[index];
              return ListTile(
                title: Text(endereco.logradouro),
                subtitle: Text(
                  '${endereco.bairro}, ${endereco.cidadeUf} - ${endereco.cep}',
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aqui, adicione um endereço de exemplo. Substitua pelos dados reais que deseja adicionar.
          controller.addHistoryItem(
            Endereco(
              logradouro: 'Logradouro Exemplo',
              bairro: 'Bairro Exemplo',
              complemento: 'Complemento Exemplo',
              cidadeUf: 'Cidade/UF Exemplo',
              cep: '00000-000',
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
