/// Extensão para implementar novos métodos no tipo de dados [String].
extension StringExtension on String {
  /// Retornará `true` caso o valor da [String] seja maior que o outro
  /// valor informado [valor].
  ///
  /// Caso contrário, retornará `false`.
  bool isMaiorQue(String valor) {
    final resultado = compareTo(valor);
    return resultado > 0;
  }

  /// Retornará `true` caso o valor da [String] seja maior que o outro
  /// valor informado [valor].
  ///
  /// Caso contrário, retornará `false`.
  bool isMenorQue(String valor) {
    final resultado = compareTo(valor);
    return resultado < 0;
  }
}
