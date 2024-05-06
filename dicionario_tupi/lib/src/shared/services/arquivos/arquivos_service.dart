import 'package:dicionario_tupi/src/shared/repositories/arquivos/arquivos_repository.dart';

/// Classe de serviço para trabalhar com arquivos.
class ArquivosService {
  /// Repositório principal do serviço.
  late final ArquivosRepository _repositorio;

  /// Construtor da classe.
  ///
  /// Classe de serviço para trabalhar com arquivos.
  ArquivosService() {
    _repositorio = ArquivosRepository();
  }

  /// Realiza a leitura do conteúdo de um arquivo e retorna
  /// em formato de [String].
  Future<String> lerArquivoDosAssets(String path) async {
    return await _repositorio.lerArquivoDosAssets(path);
  }
}
