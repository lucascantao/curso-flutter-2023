class Veiculo {
  String marca;
  String modelo;
  int ano;
  
  Veiculo({
    required this.marca, 
    required this.modelo, 
    required this.ano});
  
  void exibirInformacoes(){
    print("Veículo da marca $marca, modelo $modelo, $ano");
  }
}

class Carro extends Veiculo{
  int quilometragem;
  int numeroDePortas;
  
  Carro({
    required super.marca,
    required super.modelo,
    required super.ano,
    required this.quilometragem,
    required this.numeroDePortas
  });
  
  @override
  void exibirInformacoes() {
    super.exibirInformacoes();
    print("quilometragem: $quilometragem, número de portas: $numeroDePortas");
  }
}

class Moto extends Veiculo{
  int numeroDeCilindradas;
  bool possuiPartidaEletrica;
  
  Moto({
    required super.marca,
    required super.modelo,
    required super.ano,
    required this.numeroDeCilindradas,
    required this.possuiPartidaEletrica
  });
  
  @override
  void exibirInformacoes() {
    super.exibirInformacoes();
    print("Cilindradas: $numeroDeCilindradas, ${possuiPartidaEletrica ? "" : "não"} possui partida elétrica");
  }
}

void main() {
  Carro c = Carro(marca:"Chevrolet", modelo:"Corsa", ano:2005, quilometragem:121435, numeroDePortas:4);
  Moto m = Moto(marca:"Honda", modelo:"GG 160", ano:2015, numeroDeCilindradas:60, possuiPartidaEletrica:false);
  c.exibirInformacoes();
  m.exibirInformacoes();
}
