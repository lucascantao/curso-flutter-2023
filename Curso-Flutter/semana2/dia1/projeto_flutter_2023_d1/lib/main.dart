import 'package:flutter/material.dart';

void main() {
  final Map<String, List<String>> dados = {
    'Sobremesas': [
      'Torta de Maçã',
      'Mousse de Chocolate',
      'Pudim de Leite Condensado'
    ],
    'Pratos Principais':[
      'Frango assado com Batatas',
      'Espaguete a Bolonhesa',
      'Risoto de Cogumelos'
    ],
    'Aperitivos':[
      'Bolinhos de Queijo',
      'Bruschetta de Tomate e Majericão',
      'Canapés de Salmão com Cream Cheese'
    ]
  };

  runApp( MainApp(dados: dados, filtro: 1,));
}

class MainApp extends StatelessWidget {
  Map<String, List<String>> dados;
  int filtro;
  MainApp({super.key, required Map<String, List<String>> this.dados, required this.filtro});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        ),
      home: Scaffold(
        appBar: AppBar(title: Text("Minhas Receitas")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child:  Text(dados.keys.toList()[0], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),),
            Column(
              children: [
                Text(dados['Sobremesas']![0]),
                Text(dados['Sobremesas']![1]),
                Text(dados['Sobremesas']![2]),
              ],),
            Center(child:  Text(dados.keys.toList()[1], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),),
            Column(
              children: [
                Text(dados['Pratos Principais']![0]),
                Text(dados['Pratos Principais']![1]),
                Text(dados['Pratos Principais']![2]),
              ],),
            Center(child:  Text(dados.keys.toList()[2], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),),
            Column(
              children: [
                Text(dados['Aperitivos']![0]),
                Text(dados['Aperitivos']![1]),
                Text(dados['Aperitivos']![2]),
              ],),
          ],),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.search), onPressed: () => print("Add"),),
      ),
    );
  }
}
