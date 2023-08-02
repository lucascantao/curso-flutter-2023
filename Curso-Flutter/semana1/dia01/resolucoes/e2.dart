void main() {
    String redacao = "as férias foram um caos, mas poderia ser mais melhor";
    print(redacao);
    print('a redação é sobre as férias: ${redacao.contains('férias').toString()}');
    print('a redação possui ${redacao.split(' ').length} palavras');
    print(redacao.replaceAll('mais melhor', 'melhor'));
}