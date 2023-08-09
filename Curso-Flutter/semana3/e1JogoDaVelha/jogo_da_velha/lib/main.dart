import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Menu());
  }
}

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _Menu();
}

class _Menu extends State<Menu> {
  late String nomeJogador1;
  late String nomeJogador2;

  @override
  void initState() {
    super.initState();
    nomeJogador1 = "Jogador 1";
    nomeJogador2 = "Jogador 2";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jogo da Velha"),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Jogo da Velha",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 100,
            ),
            TextFormField(
              onChanged: (value) => setState(() => nomeJogador1 = value),
              initialValue: nomeJogador1,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "nome jogador 1"),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onChanged: (value) => setState(() => nomeJogador2 = value),
              initialValue: nomeJogador2,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "nome jogador 2"),
            ),
            const SizedBox(
              height: 16,
            ),
            BotaoJogar(jogador1: nomeJogador1, jogador2: nomeJogador2)
          ]),
        ),
      ),
    );
  }
}

class BotaoJogar extends StatelessWidget {
  final String jogador1;
  final String jogador2;

  const BotaoJogar({super.key, required this.jogador1, required this.jogador2});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (jogador1.isNotEmpty && jogador2.isNotEmpty) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => JogoTela()));
        } else {}
      },
      mouseCursor: SystemMouseCursors.click,
      child: Container(
          alignment: Alignment.center,
          width: 100,
          padding: const EdgeInsets.all(10.0),
          color: Colors.blue,
          child: const Text(
            "Jogar",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

class JogoTela extends StatelessWidget {
  const JogoTela({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: const Text("Jogo"));
  }
}
