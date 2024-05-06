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
  preOrdem,

  /// Indica que os nós da Árvore Binária estarão dispostos **em-ordem**.
  ///
  /// 1. Esquerda;
  ///
  /// 2. Raiz;
  ///
  /// 3. Direita;
  emOrdem,

  /// Indica que os nós da Árvore Binária estarão dispostos em **pós-ordem**.
  ///
  /// 1. Esquerda;
  ///
  /// 2. Direita;
  ///
  /// 3. Raiz;
  posOrdem,
}
