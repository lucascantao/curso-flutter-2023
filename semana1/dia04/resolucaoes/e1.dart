class Carro {
  String marca;
  String modelo;
  int ano;
  
  Carro(this.marca, this.modelo, this.ano);
  
  void exibirInformacoes(){
    print("Carro da marca $marca, modelo $modelo, $ano");
  }
}
void main() {
  Carro c1 = Carro("Sandero", "RTX", 2001);
  c1.exibirInformacoes();
}
