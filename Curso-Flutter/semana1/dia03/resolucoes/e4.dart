import 'dart:math';
import 'dart:io';

double calculaMedia(List<double> notas) {
    double total = 0;
    for (var nota in notas){
        total+= nota;
    }
    return total/notas.length;
}

void main() {
  List<double> notas = [];
  print("Digite as 4 notas: ");
  for(int i = 0; i<4; i++) {
      print("Nota ${i+1}");
      double nota = double.parse(stdin.readLineSync()!);
      notas.add(nota);
  }
  var media = calculaMedia(notas);
  print("Média das notas = $media");
  
}