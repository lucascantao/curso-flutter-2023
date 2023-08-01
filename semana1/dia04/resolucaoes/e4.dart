class Veiculo {
  String marca;
  String modelo;
  int ano;
  double precoBase;
  
  Veiculo({
    required this.marca, 
    required this.modelo, 
    required this.ano,
    required this.precoBase});
  
  void exibirInformacoes(){
    print("\nVeículo da marca $marca, modelo $modelo, $ano");
  }
}

class Carro extends Veiculo{
  int quilometragem;
  int numeroDePortas;
  
  Carro({
    required super.marca,
    required super.modelo,
    required super.ano,
    required super.precoBase,
    required this.quilometragem,
    required this.numeroDePortas
  });
  
  String exibirAdesivo() {
    double qpa = quilometragem/(2023-ano);
    if(qpa < 15000){
      return "seminovo";
    }
    else if (qpa < 20000){
      return "usado";
    }
    else {
      return "antigo";
    }
  }
  
  double calculaPreco() {
    return precoBase + numeroDePortas * 1000 + quilometragem * 0.01;
  }
  
  @override
  void exibirInformacoes() {
    super.exibirInformacoes();
    print("quilometragem: $quilometragem, número de portas: $numeroDePortas");
    print("Carro ${exibirAdesivo()}");
    print("Preço Base R\$$precoBase");
    print("Preço Total R\$${calculaPreco()}");
  }
  
  
}

class Moto extends Veiculo{
  int numeroDeCilindradas;
  bool possuiPartidaEletrica;
  
  Moto({
    required super.marca,
    required super.modelo,
    required super.ano,
    required super.precoBase,
    required this.numeroDeCilindradas,
    required this.possuiPartidaEletrica
  });
  
  double calculaPreco() {
    return precoBase + numeroDeCilindradas * 0.05 + (possuiPartidaEletrica ? 500 : 0);
  }
  
  @override
  void exibirInformacoes() {
    super.exibirInformacoes();
    print("Cilindradas: $numeroDeCilindradas, ${possuiPartidaEletrica ? "" : "não"} possui partida elétrica");
    print("Tipo ${exibirAdesivo()}");
    print("Preço Base R\$$precoBase");
    print("Preço Total R\$${calculaPreco()}");
  }
  
  String exibirAdesivo() {
    if (numeroDeCilindradas<125){
      return "leve";
    } else if (numeroDeCilindradas<500){
      return "normal";
    } else {
      return "esportiva";
    }
  }
}

void main() {
  Carro c = Carro(marca:"Chevrolet", modelo:"Corsa", ano:2005, precoBase: 30000.00, quilometragem:121435, numeroDePortas:4);
  Moto m = Moto(marca:"Honda", modelo:"GG 160", ano:2015, precoBase:17500.99, numeroDeCilindradas:400, possuiPartidaEletrica:true);
  c.exibirInformacoes();
  m.exibirInformacoes();
}
