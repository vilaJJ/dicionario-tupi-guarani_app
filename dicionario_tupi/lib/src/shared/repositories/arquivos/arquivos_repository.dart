import 'package:flutter/services.dart';

/// Classe de repositório para trabalhar com arquivos.
class ArquivosRepository {
  /// Construtor da classe.
  ///
  /// Classe de repositório para trabalhar com arquivos.
  ArquivosRepository();

  /// Realiza a leitura do conteúdo de um arquivo e retorna
  /// em formato de [String].
  Future<String> lerArquivoDosAssets(String path) async {
    return await rootBundle.loadString(path);
  }
}
