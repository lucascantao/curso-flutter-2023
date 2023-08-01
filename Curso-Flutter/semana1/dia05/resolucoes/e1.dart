Future<String> fetchData() {
  print("Obtendo dados...");
  return Future.delayed(const Duration(seconds: 3), () {
    return "Dados obtidos";
  });
}
void main() {
  fetchData().then((dados) => print(dados));
}