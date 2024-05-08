import 'dart:convert';

/// Classe de modelo para os nós da árvore binária de busca
/// do dicionário.
class NoDicionarioModel {
  /// Palavra no dicionário. Também é a chave do nó.
  String palavra;

  /// Significado da palavra no dicionário.
  String significado;

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

  /// Fabrica uma instância de [NoDicionarioModel], através do [map] informado.
  factory NoDicionarioModel.fromJson(Map<String, dynamic> map) {
    return NoDicionarioModel(
      palavra: map['palavra'] as String,
      significado: map['significado'] as String,
    );
  }

  /// Retorna `true` caso o nó seja **folha**, ou seja, [esquerdo] e [direito]
  /// forem iguais a `null`.
  ///
  /// Caso contrário, retornará `false`.
  bool get isFolha {
    return esquerdo == null && direito == null;
  }

  void atualizar({
    String? palavra,
    String? significado,
  }) {
    if (palavra is String) {
      this.palavra = palavra;
    }

    if (significado is String) {
      this.significado = significado;
    }
  }

  /// Gera uma lista de [NoDicionarioModel], preparada para ser inserida na
  /// Árvore Binária de Busca do Dicionário da aplicação.
  static List<NoDicionarioModel> obterListaDoJson(String json) {
    final lista = jsonDecode(json) as List;

    final qntdItens = lista.length;
    final indiceDoMeio = qntdItens ~/ 2;

    final itemMeio = lista[indiceDoMeio];

    lista.removeAt(indiceDoMeio);
    lista.insert(0, itemMeio);

    return List.generate(
      qntdItens,
      (index) => NoDicionarioModel.fromJson(lista[index]),
    );
  }
}
