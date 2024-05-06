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
      _remover(no, _raiz);
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
    List<NoDicionarioModel> retorno = const [],
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
    List<NoDicionarioModel> retorno = const [],
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
  void _remover(NoDicionarioModel noRemover, NoDicionarioModel? noAtual) {
    if (noRemover.palavra == noAtual!.palavra) {
      // Nó folha.
      if (noAtual.isFolha == true) {
        noAtual = null;
      }
      // Nó com um filho.
      else if (noAtual.esquerdo == null) {
        noAtual = noAtual.direito;
      }
      // Nó com um filho.
      else if (noAtual.direito == null) {
        noAtual = noAtual.esquerdo;
      }
      // Nó com dois filhos.
      else {
        final noSubstituto = _obterMenorNo(noAtual.direito!);
        noAtual.palavra = noSubstituto.palavra;
        _remover(noSubstituto, noAtual.direito);
      }
    } else if (noRemover.palavra.isMaiorQue(noAtual.palavra)) {
      if (noAtual.direito is NoDicionarioModel) {
        _remover(noRemover, noAtual.direito!);
      }
    } else {
      if (noAtual.esquerdo is NoDicionarioModel) {
        _remover(noRemover, noAtual.esquerdo!);
      }
    }
  }

  /// Retorna o menor nó de determinada árvore binária de busca.
  NoDicionarioModel _obterMenorNo(NoDicionarioModel noAtual) {
    while (noAtual.esquerdo is NoDicionarioModel) {
      noAtual = noAtual.esquerdo!;
    }

    return noAtual;
  }
}
