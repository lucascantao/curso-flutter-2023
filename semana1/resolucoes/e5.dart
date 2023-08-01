void main() {
  Map<String, int> pesos = {
    'Carol':58,
    'Lucas':60,
    'Katarina':85,
    'Astoufo':117,
  };
  int? pesoNovo = pesos['Katarina'];
  print(pesos);
  print(pesoNovo);
  pesos.remove('Carol');
  print(pesos);
  print('contém meu primeiro nome? = ${pesos.containsKey('José')}');
}