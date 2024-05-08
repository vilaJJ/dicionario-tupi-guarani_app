/// Enumerador para indicar qual a ordenação que a Árvore Binária de Busca
/// irá trabalhar.
enum OrdemArvoreBinaria {
  /// Indica que os nós da Árvore Binária estarão dispostos em  **pré-ordem**.
  ///
  /// 1. Raiz;
  ///
  /// 2. Esquerda;
  ///
  /// 3. Direita;
  preOrdem(
    nome: "Pré-ordem",
  ),

  /// Indica que os nós da Árvore Binária estarão dispostos **em-ordem**.
  ///
  /// 1. Esquerda;
  ///
  /// 2. Raiz;
  ///
  /// 3. Direita;
  emOrdem(
    nome: "Em-ordem",
  ),

  /// Indica que os nós da Árvore Binária estarão dispostos em **pós-ordem**.
  ///
  /// 1. Esquerda;
  ///
  /// 2. Direita;
  ///
  /// 3. Raiz;
  posOrdem(
    nome: "Pós-ordem",
  );

  /// Nome do método.
  final String nome;

  /// Construtor do enumerador.
  ///
  /// Enumerador para indicar qual a ordenação que a Árvore Binária de Busca
  /// irá trabalhar.
  const OrdemArvoreBinaria({
    required this.nome,
  });
}
