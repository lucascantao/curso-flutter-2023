import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:Tela(),
  ));
}

class Tela extends StatelessWidget {
  @override
  Widget build (BuildContext context){
    return Scaffold(
    body: Column(children: [ const Cabecalho(), const Corpo(), Contador(valorInicial: 3)]));
  }
}

class Cabecalho extends StatefulWidget {
  const Cabecalho({super.key});
  
  @override
  State<Cabecalho> createState() => _CabecalhoState();
}

class _CabecalhoState extends State<Cabecalho> {
  @override
  Widget build(BuildContext context) {
    return Text("Cabecalho");
  }
}

class Corpo extends StatefulWidget {
  final int valor = 10;
  const Corpo({super.key});
  
  @override
  State<Corpo> createState() => _CorpoState();
  
}

class _CorpoState extends State<Corpo> {
  @override
  Widget build (BuildContext context){
    return Text('valor ${widget.valor}');
  }
}

class Contador extends StatefulWidget {
  final int valorInicial;
  Contador({super.key, required this.valorInicial});
  
  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  late int count = 0;
  @override
  void initState() {
    super.initState();
    count = widget.valorInicial;
  }
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Text("$count"),
        TextButton(
          child: const Text('+'),
          onPressed: () {
            setState(() {
              count += 1;
            });
          }
        )
      ]
    );
  }
}
