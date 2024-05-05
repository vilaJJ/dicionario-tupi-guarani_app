/// Classe de modelo para os nós da árvore binária de busca
/// do dicionário.
class NoDicionarioModel {
  /// Palavra no dicionário. Também é a chave do nó.
  String palavra;

  /// Significado da palavra no dicionário.
  final String significado;

  /// Nó à esquerda da raiz.
  NoDicionarioModel? esquerdo;

  /// Nó à direita da raiz.
  NoDicionarioModel? direito;

  /// Construtor da classe.
  ///
  /// Classe de modelo para os nós da árvore binária de busca
  /// do dicionário.
  NoDicionarioModel({
    required this.palavra,
    required this.significado,
    this.esquerdo,
    this.direito,
  });

  /// Retorna `true` caso o nó seja **folha**, ou seja, [esquerdo] e [direito]
  /// forem iguais a `null`.
  ///
  /// Caso contrário, retornará `false`.
  bool get isFolha {
    return esquerdo == null && direito == null;
  }
}
