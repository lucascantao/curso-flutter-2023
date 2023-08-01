void main() {
  var notas = [6, 9, 8, 10];

  notas.add(10);
  print('adicionar 10 = $notas');
  
  notas.removeAt(2) ;
  print('remover 3  nota = $notas');
  
  List<int> notas1Semestre = notas  .toList().sublist(0,2);
  print('apenas 1 semestre = $notas1Semestre')  ;
  
  notas.remove(11)  ;
  print('remove no  tas 11 = $notas');
  
  notas.sort()  ;
  print('orena  r notas = $notas');
}