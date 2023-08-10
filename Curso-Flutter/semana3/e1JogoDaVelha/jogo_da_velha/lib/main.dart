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
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      TelaJogo(jogador1: jogador1, jogador2: jogador2)));
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

class TelaJogo extends StatefulWidget {
  String jogador1;
  String jogador2;
  TelaJogo({super.key, required this.jogador1, required this.jogador2});

  @override
  State<TelaJogo> createState() => _TelaJogoState();
}

class _TelaJogoState extends State<TelaJogo> {
  String jogador = 'x';
  String jogadorAtual = '';
  bool running = true;
  List<Map<int, String>> tabuleiro = [
    {1: '', 2: '', 3: ''},
    {4: '', 5: '', 6: ''},
    {7: '', 8: '', 9: ''}
  ];

  @override
  void initState() {
    super.initState();
    jogadorAtual = widget.jogador1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                width: 200,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(jogadorAtual),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: tabuleiro.map((row) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: row.entries.map((celula) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  if (row[celula.key]!.isEmpty && running) {
                                    row[celula.key] = jogador;
                                    if (checarFimDeJogo(tabuleiro)) {
                                      running = false;
                                      jogadorAtual = "FIM DE JOGO";
                                    } else if (checarVitoria(
                                        celula.key, jogador, tabuleiro)) {
                                      running = false;
                                      jogadorAtual = "$jogadorAtual VENCEU :0";
                                    } else {
                                      jogador = jogador == 'x' ? 'o' : 'x';
                                      jogadorAtual =
                                          jogadorAtual == widget.jogador1
                                              ? widget.jogador2
                                              : widget.jogador1;
                                    }
                                  }
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 50,
                                color: Colors.grey,
                                child: Text(
                                  celula.value,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 10),
                    (running
                        ? const Text("")
                        : InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              color: Colors.green,
                              child: const Text(
                                "Reiniciar",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ))
                  ],
                ))));
  }
}

bool checarFimDeJogo(List<Map<int, String>> valores) {
  for (var element in valores) {
    for (var value in element.values) {
      if (value.isEmpty) return false;
    }
    ;
  }

  return true;
}

bool checarVitoria(int celula, String jogador, List<Map<int, String>> valores) {
  List<List<int>> condicaoVitoria = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7]
  ];
  int match = 0;
  for (List<int> condicao in condicaoVitoria) {
    match = 0;
    if (condicao.contains(celula)) {
      for (int elemento in condicao) {
        for (Map<int, String> row in valores) {
          row.forEach((key, value) {
            if (key == elemento && value == jogador) match++;
          });
        }
        if (match >= 3) return true;
      }
    }
  }
  return false;
}
