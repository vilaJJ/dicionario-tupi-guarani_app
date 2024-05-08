import 'package:dicionario_tupi/src/shared/extensions/string/string_extension.dart';
import 'package:dicionario_tupi/src/shared/models/arvore_binaria/dicionario/no_dicionario_model.dart';

/// Classe de serviço, para operações com Árvores binárias
/// no dicionário da aplicação.
class DicionarioArvoreBinariaService {
  /// Nó raiz da árvore binária de busca.
  NoDicionarioModel? _raiz;

  /// Retorna o nó raiz da árvore binária de busca.
  ///
  /// Caso a árvore não possua raiz, será estourada uma exceção.
  NoDicionarioModel get raiz {
    if (_raiz is NoDicionarioModel) {
      return _raiz!;
    }

    throw Exception("A raiz da árvore binária é nula.");
  }

  /// Insere um valor na árvore binária de busca.
  void inserir(NoDicionarioModel no) {
    if (_raiz is NoDicionarioModel) {
      _inserir(no, _raiz!);
    } else {
      _raiz = no;
    }
  }

  /// Insere uma lista de valores na árvore binária de busca.
  void inserirLista(List<NoDicionarioModel> nos) {
    for (final no in nos) {
      inserir(no);
    }
  }

  /// Remove o nó especificado em [noRemover], da Árvore binária de busca do Dicionário.
  void remover(NoDicionarioModel no) {
    if (_raiz is NoDicionarioModel) {
      _remover(_raiz, no);
      return;
    }

    throw Exception("Não existem palavras para serem removidas do dicionário.");
  }

  /// Retorna uma lista de nós do dicionário, referentes aos nós da Árvore binária
  /// dispostos em **pré-ordem**.
  ///
  /// 1. Raiz;
  ///
  /// 2. Esquerda;
  ///
  /// 3. Direita;
  List<NoDicionarioModel> obterPreOrdem({
    required NoDicionarioModel? no,
    required String pesquisa,
    required List<NoDicionarioModel> retorno,
  }) {
    if (no is NoDicionarioModel) {
      if (no.palavra.toUpperCase().contains(pesquisa.toUpperCase())) {
        retorno.add(no);
      }
      retorno = obterPreOrdem(no: no.esquerdo, pesquisa: pesquisa, retorno: retorno);
      retorno = obterPreOrdem(no: no.direito, pesquisa: pesquisa, retorno: retorno);
    }

    return retorno;
  }

  /// Retorna uma lista de nós do dicionário, referentes aos nós da Árvore binária
  /// dispostos **em-ordem**.
  ///
  /// 1. Esquerda;
  ///
  /// 2. Raiz;
  ///
  /// 3. Direita;
  List<NoDicionarioModel> obterEmOrdem({
    required NoDicionarioModel? no,
    required String pesquisa,
    required List<NoDicionarioModel> retorno,
  }) {
    if (no is NoDicionarioModel) {
      retorno = obterEmOrdem(no: no.esquerdo, pesquisa: pesquisa, retorno: retorno);

      if (no.palavra.toUpperCase().contains(pesquisa.toUpperCase())) {
        retorno.add(no);
      }
      retorno = obterEmOrdem(no: no.direito, pesquisa: pesquisa, retorno: retorno);
    }

    return retorno;
  }

  /// Retorna uma lista de nós do dicionário, referentes aos nós da Árvore binária
  /// dispostos em **pós-ordem**.
  ///
  /// 1. Esquerda;
  ///
  /// 2. Direita;
  ///
  /// 3. Raiz;
  List<NoDicionarioModel> obterPosOrdem({
    required NoDicionarioModel? no,
    required String pesquisa,
    required List<NoDicionarioModel> retorno,
  }) {
    if (no is NoDicionarioModel) {
      retorno = obterPosOrdem(no: no.esquerdo, pesquisa: pesquisa, retorno: retorno);
      retorno = obterPosOrdem(no: no.direito, pesquisa: pesquisa, retorno: retorno);

      if (no.palavra.toUpperCase().contains(pesquisa.toUpperCase())) {
        retorno.add(no);
      }
    }

    return retorno;
  }

  /// Insere um valor na árvore binária, de forma recursiva.
  ///
  /// Caso a palavra já exista na árvore do dicionário, será estourada uma exceção.
  void _inserir(NoDicionarioModel noInserir, NoDicionarioModel noAtual) {
    if (noInserir.palavra.isMaiorQue(noAtual.palavra)) {
      if (noAtual.direito is NoDicionarioModel) {
        _inserir(noInserir, noAtual.direito!);
      } else {
        noAtual.direito = noInserir;
      }
    } else {
      if (noAtual.esquerdo is NoDicionarioModel) {
        _inserir(noInserir, noAtual.esquerdo!);
      } else {
        noAtual.esquerdo = noInserir;
      }
    }
  }

  /// Remove o nó especificado em [noRemover], da Árvore binária de busca do
  /// Dicionário, de forma recursiva.
  NoDicionarioModel? _remover(NoDicionarioModel? noAtual, NoDicionarioModel noRemover) {
    if (noAtual == null) {
      return noAtual;
    }

    if (noRemover.palavra.isMenorQue(noAtual.palavra)) {
      noAtual.esquerdo = _remover(noAtual.esquerdo, noRemover);
    } else if (noRemover.palavra.isMaiorQue(noAtual.palavra)) {
      noAtual.direito = _remover(noAtual.direito, noRemover);
    } else {
      if (noAtual.esquerdo == null) {
        return noAtual.direito;
      } else if (noAtual.direito == null) {
        return noAtual.esquerdo;
      }

      noAtual = _obterSucessorEmOrdem(noAtual.direito);
      noAtual?.direito = _remover(noAtual.direito, noRemover);
    }

    return noAtual;
  }

  /// Retorna o menor nó de determinada árvore binária de busca.
  NoDicionarioModel? _obterSucessorEmOrdem(NoDicionarioModel? no) {
    NoDicionarioModel? retorno = no;
    
    while (no?.esquerdo != null) {
      retorno = no?.esquerdo!;
      no = no?.esquerdo!;
    }

    return retorno;
  }
}
