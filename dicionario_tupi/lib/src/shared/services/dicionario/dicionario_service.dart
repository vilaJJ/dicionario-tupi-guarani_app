import 'package:dicionario_tupi/src/shared/enums/arvore_binaria/ordem_arvore_binaria_enum.dart';
import 'package:dicionario_tupi/src/shared/models/arvore_binaria/dicionario/no_dicionario_model.dart';
import 'package:dicionario_tupi/src/shared/services/arquivos/arquivos_service.dart';
import 'package:dicionario_tupi/src/shared/services/arvore_binaria/dicionario/dicionario_arvore_binaria_service.dart';

/// Classe de serviço do dicionário da aplicação.
class DicionarioService {
  /// Instância do serviço de Árvore Binária de Busca do Dicionário.
  final DicionarioArvoreBinariaService arvoreBinariaService;

  /// Instância do serviço de arquivos da aplicação.
  final ArquivosService arquivosService;

  /// Indica qual a ordenação que a Árvore Binária utilizará para
  /// recuperar os valores.
  OrdemArvoreBinaria ordenacao;

  /// Palavra a ser pesquisada nas consultas da Árvore Binária de Busca.
  ///
  /// Se o texto for vazio, será retornada todas as palavras do dicionário.
  String pesquisa;

  /// Construtor da classe.
  ///
  /// Classe de serviço do dicionário da aplicação.
  DicionarioService({
    required this.arvoreBinariaService,
    required this.arquivosService,
    this.ordenacao = OrdemArvoreBinaria.emOrdem,
    this.pesquisa = "",
  });

  /// Inicializa a árvore binária do dicionário, adicionando as palavras
  /// existentes no arquivo _JSON_ provedor.
  Future<List<NoDicionarioModel>> inicializarDicionario() async {
    final json = await arquivosService.lerArquivoDosAssets(
      "assets/dicionario/json/dicionario.json",
    );

    final lista = NoDicionarioModel.obterListaDoJson(json);
    arvoreBinariaService.inserirLista(lista);

    return _obter();
  }

  /// Retorna a lista de palavras do dicionário, baseado nos valores
  /// de [ordenacao] e [pesquisa] informados.
  Future<List<NoDicionarioModel>> obter({
    OrdemArvoreBinaria? ordenacao,
    String? pesquisa,
  }) async {
    if (ordenacao is OrdemArvoreBinaria) {
      this.ordenacao = ordenacao;
    }
    if (pesquisa is String) {
      this.pesquisa = pesquisa;
    }

    return await _obter();
  }

  /// Insere uma palavra no dicionário e retorna a lista com os
  /// valores atualizados, baseado na última filtragem informada.
  Future<List<NoDicionarioModel>> inserir(NoDicionarioModel palavra) async {
    arvoreBinariaService.inserir(palavra);
    return await _obter();
  }

  /// Remove uma palavra no dicionário e retorna a lista com os
  /// valores atualizados, baseado na última filtragem informada.
  Future<List<NoDicionarioModel>> remover(NoDicionarioModel palavra) async {
    arvoreBinariaService.remover(palavra);
    return await _obter();
  }

  /// Retorna a lista de palavras do dicionário, baseado nos valores
  /// de [ordenacao] e [pesquisa] informados.
  Future<List<NoDicionarioModel>> _obter() async {
    final raiz = arvoreBinariaService.raiz;
    final retorno = <NoDicionarioModel>[];

    return await Future<List<NoDicionarioModel>>.sync(() {
      switch (ordenacao) {
        case OrdemArvoreBinaria.preOrdem:
          arvoreBinariaService.obterPreOrdem(
            no: raiz,
            pesquisa: pesquisa,
            retorno: retorno,
          );
          break;
        case OrdemArvoreBinaria.emOrdem:
          arvoreBinariaService.obterEmOrdem(
            no: raiz,
            pesquisa: pesquisa,
            retorno: retorno,
          );
          break;
        case OrdemArvoreBinaria.posOrdem:
          arvoreBinariaService.obterPosOrdem(
            no: raiz,
            pesquisa: pesquisa,
            retorno: retorno,
          );
          break;
      }

      return retorno;
    });
  }
}
