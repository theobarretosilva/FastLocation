import 'package:flutter/material.dart';
import '../../../shared/colors/colors.dart';

class LatestLocations extends StatelessWidget {
    final String bairro;
    final String logradouro;
    final String cidadeUf;
    final String cep;

    const LatestLocations({
        Key? key,
        required this.bairro,
        required this.logradouro,
        required this.cidadeUf,
        required this.cep,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Container(
            child: Column(
                children: [
                    Flex(
                        direction: Axis.horizontal,
                        children: [
                            Image.asset(
                                '../../assets/images/directions_icon.png',
                                width: 30,
                                height: 30,
                            ),
                            Column(
                                children: [
                                    Text(
                                        bairro,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.start
                                    ),
                                    Text(
                                        logradouro,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14
                                        ),
                                        textAlign: TextAlign.start
                                    )
                                ]
                            ),
                            Column(
                                children: [
                                    Text(
                                        cidadeUf,
                                        style: TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 16
                                        ),
                                        textAlign: TextAlign.end
                                    ),
                                    Text(
                                        cep,
                                        style: TextStyle(
                                            color: Colors.black, 
                                            fontSize: 14, 
                                            fontWeight: FontWeight.bold
                                        ),
                                        textAlign: TextAlign.end
                                    )
                                ]
                            )
                        ]
                    )
                    
                ]
            )
        );
    }
}