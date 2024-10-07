import 'package:fast_location/src/modules/home/controller/modal_controller.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

 final _controller = ModalController();

class ButtonSearch extends StatelessWidget {
  const ButtonSearch({super.key});

  searchCEP(String cep ) async {
  String url = "https://viacep.com.br/ws/${cep}/json/";

  http.Response response;

  response = await http.get(Uri.parse(url));

  Map<String, dynamic> retorno = json.decode(response.body);

  return retorno;
}

  @override
  Widget build(BuildContext context) {

    return  ElevatedButton(
              onPressed: () async {
              // Chama o modal e aguarda o valor retornado
            String? valor = await _controller.showModal(context);

            // Exibe o valor retornado em um SnackBar, por exemplo
            if (valor != null) {
               Map<String, dynamic> res = await searchCEP(valor);
         

              ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Valor inserido:'+ res["bairro"]))
              );
            }

            _controller.clear();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 45), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: const Text('Localizar Endereço', style: TextStyle( color: Color(0xFFFFFFFF)),),
            );
  }
}