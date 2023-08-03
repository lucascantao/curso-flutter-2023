import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Receitas")),
          body: Column(
            children: [
              Center(child: Text("Sobremesas", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
              Text("Torta de Maçã"),
              Text("Mousse de Chocolate"),
              Text("Pudim de Leite Condesado"),
              Center(child: Text("Pratos Principais", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
              Text("Frango Assado com Batatas"),
              Text("Espaguete à Bolonhesa"),
              Text("Risoto de Cogumelos"),
              Center(child: Text("Aperitivos", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
              Text("Bolinhos de Queijo"),
              Text("Bruschetta de Tomate e Manjericão"),
              Text("Canapés de Salmão com Cream Cheese"),
            ],
          )),
    );
  }
}
