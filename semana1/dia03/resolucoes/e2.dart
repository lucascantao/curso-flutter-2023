import 'dart:math';
import 'dart:io';

void main() {
  int tentativas = 5;
  bool isNumeroCorreto = false;
  int n = Random().nextInt(10) + 1;

  print("Adivinhe o número secreto");
  while (tentativas > 0 && !isNumeroCorreto){

    int resposta = int.parse(stdin.readLineSync()!);

    if (resposta > n){
        print("O número secreto é menor");
    } else if (resposta < n) {
        print("O número secreto é maior");
    } else {
        print("Acertou");
        isNumeroCorreto = true;
    }
    tentativas--;
  }

}