void main() {
  String pesoBalanca = '-70.65';
  double pesoAtual = double.parse(pesoBalanca);
  print('peso atual = $pesoAtual');
  print('peso absoluto = ${pesoAtual.abs()}');
  print('peso inteiro mais próximo = ${pesoAtual.abs().round()}');
}