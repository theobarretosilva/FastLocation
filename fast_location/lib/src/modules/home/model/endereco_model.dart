import 'dart:convert';

class Endereco {
  String logradouro;
  String bairro;
  String complemento;
  String cidadeUf;
  String cep;

  Endereco({
    required this.logradouro,
    required this.bairro,
    required this.complemento,
    required this.cidadeUf,
    required this.cep,
  });

  Map<String, dynamic> toMap() {
    return {
      'logradouro': logradouro,
      'bairro': bairro,
      'complemento': complemento,
      'cidadeUf': cidadeUf,
      'cep': cep,
    };
  }

  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      logradouro: map['logradouro'] ?? '',
      bairro: map['bairro'] ?? '',
      complemento: map['complemento'] ?? '',
      cidadeUf: map['cidadeUf'] ?? '',
      cep: map['cep'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Endereco.fromJson(String source) =>
      Endereco.fromMap(json.decode(source));
}
