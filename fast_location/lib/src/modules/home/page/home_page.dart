import 'package:fast_location/src/modules/home/components/button_history.dart';
import 'package:fast_location/src/modules/home/components/button_search.dart';
import 'package:fast_location/src/modules/home/components/container_history.dart';
import 'package:fast_location/src/modules/home/components/container_message.dart';
import 'package:fast_location/src/modules/home/components/logo_box.dart';
import 'package:fast_location/src/modules/home/controller/modal_controller.dart';
import 'package:fast_location/src/modules/home/components/resultado_consulta.dart';
import 'package:flutter/material.dart';
import '../components/latest_locations.dart';
import '../../history/controller/history_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fast_location/src/modules/home/model/endereco_model.dart';

final ModalController _controller = ModalController();
bool resultado = false;
late String logradouro;
late String bairro;
late String complemento;
late String cidadeUf;
late String ceP;

final HistoryController controller = HistoryController();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> searchCEP(String cep) async {
    String url = "https://viacep.com.br/ws/$cep/json/";
    http.Response response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      Map<String, dynamic> retorno = json.decode(response.body);
      
      if (retorno["erro"] != null) {
        return false; // CEP não encontrado
      }
      
      logradouro = retorno["logradouro"];
      bairro = retorno["bairro"];
      complemento = retorno["complemento"];
      cidadeUf = "${retorno["localidade"]}, ${retorno["uf"]}";
      ceP = retorno["cep"];

      Endereco endereco = Endereco.fromMap(retorno);
      controller.addHistoryItem(endereco);
      return true; // CEP encontrado
    }
    
    return false; // Erro na requisição
  }

  Future<void> openGoogleMaps(String destination) async {
    final googleMapsUrl = 'https://www.google.com/maps/dir/?api=1&destination=$destination&travelmode=driving';

    if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
      await launchUrl(Uri.parse(googleMapsUrl));
    } else {
      throw 'Could not open the map.';
    }
  }

  @override
  Widget build(BuildContext context) {
    controller.loadHistory();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const LogoBox(),
            const SizedBox(height: 20),
            (resultado 
              ? ResultadoConsulta(
                  logradouro: logradouro,
                  bairro: bairro,
                  complemento: complemento,
                  cidadeUf: cidadeUf,
                  cep: ceP
                ) 
              : const ContainerMessage()
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String? valor = await _controller.showModal(context);

                if (valor != null) {
                  if (await searchCEP(valor)) {
                    setState(() {
                      resultado = true;
                    });
                  } else {
                    // Caso o CEP não seja encontrado, mostrar mensagem
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('CEP $valor não encontrado!')),
                    );
                  }
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
              child: const Text('Localizar Endereço', style: TextStyle(color: Color(0xFFFFFFFF))),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Icon(Icons.place, color: Color(0xFF204C22), size: 30),
                SizedBox(width: 16),
                Text(
                  'Últimos endereços localizados',
                  style: TextStyle(fontSize: 16, color: Color(0xFF204C22)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const ContainerHistory(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: controller.history.length,
                itemBuilder: (context, index) {
                  Endereco endereco = controller.history[index];
                  return LatestLocations(
                    bairro: endereco.bairro,
                    logradouro: endereco.logradouro,
                    cidadeUf: endereco.cidadeUf,
                    cep: endereco.cep,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const ButtonHistory(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFFE0E0E0),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 32), // Espaço para manter a simetria
              FloatingActionButton(
                onPressed: () {
                  String destination = "Avenida Cruz e Souza, 441";
                  openGoogleMaps(destination);
                },
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(Icons.alt_route_rounded, color: Colors.white),
              ),
              const SizedBox(width: 32), // Espaço para manter a simetria
            ],
          ),
        ),
      ),
    );
  }
}
