import 'package:flutter/material.dart';

class ModalController {
  final TextEditingController textController = TextEditingController();


  Future<String?> showModal(BuildContext context) async {
    return await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Digite o CEP do Endereço'),
          content: TextField(
            controller: textController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Insira um valor aqui'),
          ),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop(textController.text);
              },
            ),
          ],
        );
      },
    );
  }

  // Limpar o controlador após uso (opcional)
  void clear() {
    textController.clear();
  }
}