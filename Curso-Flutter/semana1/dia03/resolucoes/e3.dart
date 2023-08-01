import 'dart:math';
import 'dart:io';

void main() {
  int precoMaximo = 23;
  List<int> precos = [];

  for(int i = 0; i < 10; i++){
    int preco = Random().nextInt(precoMaximo);
    precos.add(preco);
  }

  List<int> pares = precos.where((p) => p%2 == 0).toList();

  print("Preços ${precos}");
  print("Preços pares ${pares}");
}