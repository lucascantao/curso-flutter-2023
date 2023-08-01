import 'dart:math';
import 'dart:io';

void main() {
  var desconto = 0.3;
  var aplicaDesconto = (double precoBase) => precoBase -= precoBase * desconto;
  print("Forneça o valor do produto: ");
  double preco = double.parse(stdin.readLineSync()!);
  double novoPreco = aplicaDesconto(preco);
  print("Novo preço com desconto de ${desconto*100}% = R\$${novoPreco.toStringAsFixed(2)}");
  
}