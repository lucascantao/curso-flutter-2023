import 'dart:math';

Future<String> tarefa1() async {
  int time = Random().nextInt(10);
  return await Future.delayed(Duration(seconds: time),() {
    return "Tarefa (1) concluída em ${time}s";
  });
}

Future<String> tarefa2() async {
  int time = Random().nextInt(10);
  return await Future.delayed(Duration(seconds: time),() {
    return "Tarefa (2) concluída em ${time}s";
  });
}

Future<String> tarefa3() async {
  int time = Random().nextInt(10);
  return await Future.delayed(Duration(seconds: time),() {
    return "Tarefa (3) concluída em ${time}s";
  });
}


void main() {
  tarefa1().then((value) => print(value));
  tarefa2().then((value) => print(value));
  tarefa3().then((value) => print(value));
}