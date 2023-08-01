class Veiculo {
  String marca;
  String modelo;
  int ano;
  
  Veiculo({
    required this.marca, 
    required this.modelo, 
    required this.ano});
  
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
    required this.quilometragem,
    required this.numeroDePortas
  });
  
  @override
  void exibirInformacoes() {
    super.exibirInformacoes();
    print("quilometragem: $quilometragem, número de portas: $numeroDePortas");
    print("Carro ${exibirAdesivo()}");
  }
  
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
    print("Tipo ${exibirAdesivo()}");
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
  Carro c = Carro(marca:"Chevrolet", modelo:"Corsa", ano:2005, quilometragem:121435, numeroDePortas:4);
  Moto m = Moto(marca:"Honda", modelo:"GG 160", ano:2015, numeroDeCilindradas:400, possuiPartidaEletrica:false);
  c.exibirInformacoes();
  m.exibirInformacoes();
}
