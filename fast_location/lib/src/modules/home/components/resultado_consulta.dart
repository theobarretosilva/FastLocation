import 'package:flutter/material.dart';
import '../../../shared/colors/colors.dart';

class ResultadoConsulta extends StatelessWidget {
    final String logradouro;
    final String bairro;
    final String complemento;
    final String cidadeUf;
    final String cep;

    const ResultadoConsulta({super.key, 
        required this.logradouro,
        required this.bairro,
        required this.complemento,
        required this.cidadeUf,
        required this.cep,
    });

    @override
    Widget build(BuildContext context) {
        return Container(
            color: AppColors.secondary,
            padding: const EdgeInsets.all(16.0),
            child: Column(
                children: [
                    const Text(
                        "Dados da Localização",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.tertiary, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text.rich(
                        TextSpan(
                            text: "Logradouro/Rua: ",
                            style: const TextStyle(color: AppColors.tertiary, fontSize: 16),
                            children: [
                                TextSpan(
                                    text: logradouro,
                                    style: const TextStyle(color: Colors.black, fontSize: 16),
                                ),
                            ],
                        ),
                    ),
                    const SizedBox(height: 5),
                    Text.rich(
                        TextSpan(
                            text: "Bairro/Distrito: ",
                            style: const TextStyle(color: AppColors.tertiary, fontSize: 16),
                            children: [
                                TextSpan(
                                    text: bairro,
                                    style: const TextStyle(color: Colors.black, fontSize: 16),
                                ),
                            ],
                        ),
                    ),
                    const SizedBox(height: 5),
                    Text.rich(
                        TextSpan(
                            text: "Complemento: ",
                            style: const TextStyle(color: AppColors.tertiary, fontSize: 16),
                            children: [
                                TextSpan(
                                    text: complemento,
                                    style: const TextStyle(color: Colors.black, fontSize: 16),
                                ),
                            ],
                        ),
                    ),
                    const SizedBox(height: 5),
                    Text.rich(
                        TextSpan(
                            text: "Cidade/UF: ",
                            style: const TextStyle(color: AppColors.tertiary, fontSize: 16),
                            children: [
                                TextSpan(
                                    text: cidadeUf,
                                    style: const TextStyle(color: Colors.black, fontSize: 16),
                                ),
                            ],
                        ),
                    ),
                    const SizedBox(height: 5),
                    Text.rich(
                        TextSpan(
                            text: "CEP: ",
                            style: const TextStyle(color: AppColors.tertiary, fontSize: 16),
                            children: [
                                TextSpan(
                                    text: cep,
                                    style: const TextStyle(color: Colors.black, fontSize: 16),
                                ),
                            ],
                        ),
                    )    
                ],
            ),
        );
    }
}
