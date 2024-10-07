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

  factory Endereco.fromMap(Map<String, dynamic> retorno) {
    return Endereco(
      logradouro: retorno["logradouro"] ?? '',
      bairro: retorno["bairro"] ?? '',
      complemento: retorno["complemento"] ?? '',
      cidadeUf: '${retorno["localidade"]}, ${retorno["uf"]}',
      cep: retorno["cep"] ?? '',
    );
  }

  @override
  String toString() {
    return 'Endereço: $logradouro, $bairro, $complemento, $cidadeUf, CEP: $cep';
  }
}
