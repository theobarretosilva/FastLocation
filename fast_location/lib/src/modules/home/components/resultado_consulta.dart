import 'package:flutter/material.dart';
import '../../../shared/colors/colors.dart';

class ResultadoConsulta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,
      padding: const EdgeInsets.all(16.0), // Adiciona um espaçamento interno
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinha os textos à esquerda
        children: [
          Text(
            "Dados da Localização",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.tertiary, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10), // Espaçamento entre os textos
          Text.rich(
            TextSpan(
              text: "Logradouro/Rua: ",
              style: TextStyle(color: AppColors.tertiary, fontSize: 16),
              children: [
                TextSpan(
                  text: "Rua Cruz e Souza",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
