import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class Produto {
  String nome;
  String descricao;
  double preco;
  int estoque;
  Produto(
      {required this.nome,
      required this.preco,
      required this.descricao,
      required this.estoque});
}

class MainApp extends StatelessWidget {
  List<Produto> produtos = [
    Produto(
        nome: 'Açucar',
        descricao: 'Pacote açucar 1kg',
        estoque: 5,
        preco: 20.00),
    Produto(
        nome: 'Geladeira',
        preco: 4059.89,
        descricao: 'Brastemp 2001',
        estoque: 2)
  ];

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Estoque"),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Column(
            children: produtos.map((produto) {
              return ItemProduto(
                  nome: produto.nome,
                  descricao: produto.descricao,
                  preco: produto.preco,
                  estoque: produto.estoque);
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class ItemProduto extends StatefulWidget {
  String nome;
  String descricao;
  double preco;
  int estoque;

  ItemProduto(
      {super.key,
      required this.nome,
      required this.descricao,
      required this.preco,
      required this.estoque});

  @override
  State<ItemProduto> createState() => _ItemProdutoState();
}

class _ItemProdutoState extends State<ItemProduto> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Produto? produto = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => TelaDetalhes(
                    nome: widget.nome,
                    descricao: widget.descricao,
                    preco: widget.preco,
                    estoque: widget.estoque)));

        if (produto != null) {
          setState(() {
            widget.nome = produto!.nome;
            widget.descricao = produto.descricao;
            widget.preco = produto.preco;
            widget.estoque = produto.estoque;
          });
        }
      },
      mouseCursor: SystemMouseCursors.click,
      child: Container(
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.all(5),
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 56,
                    child: Icon(Icons.shopping_bag_outlined),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.nome,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text("${widget.descricao} R\$ ${widget.preco}",
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey))
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 56,
                child: Text("x${widget.estoque}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 89, 0))),
              ),
            ],
          )),
    );
  }
}

class TelaDetalhes extends StatefulWidget {
  String nome;
  String descricao;
  double preco;
  int estoque;

  TelaDetalhes(
      {super.key,
      required this.nome,
      required this.descricao,
      required this.preco,
      required this.estoque});

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("detalhes"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                onChanged: (value) => setState(() {
                  widget.nome = value;
                }),
                initialValue: widget.nome,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "nome"),
              ),
              TextFormField(
                onChanged: (value) => setState(() {
                  widget.descricao = value;
                }),
                initialValue: widget.descricao,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "descricao"),
              ),
              TextFormField(
                onChanged: (value) => setState(() {
                  widget.preco = double.parse(value);
                }),
                initialValue: "${widget.preco}",
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "preco"),
              ),
              TextFormField(
                onChanged: (value) => setState(() {
                  widget.estoque = int.parse(value);
                }),
                initialValue: "${widget.estoque}",
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "estoque"),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(
                      context,
                      Produto(
                          nome: widget.nome,
                          preco: widget.preco,
                          descricao: widget.descricao,
                          estoque: widget.estoque));
                },
                mouseCursor: SystemMouseCursors.click,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  height: 64,
                  color: Colors.amber,
                  child: const Text(
                    "Salvar",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
