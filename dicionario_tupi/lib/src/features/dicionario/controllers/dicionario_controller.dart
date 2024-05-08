import 'package:dicionario_tupi/src/features/dicionario/components/inserir_palavra/inserir_palavra_dicionario_component.dart';
import 'package:dicionario_tupi/src/features/dicionario/pages/dicionario_page.dart';
import 'package:dicionario_tupi/src/shared/enums/arvore_binaria/ordem_arvore_binaria_enum.dart';
import 'package:dicionario_tupi/src/shared/models/arvore_binaria/dicionario/no_dicionario_model.dart';
import 'package:dicionario_tupi/src/shared/navigation/navigation.dart';
import 'package:dicionario_tupi/src/shared/services/dicionario/dicionario_service.dart';
import 'package:get/get.dart';

/// Controlador da página [DicionarioPage].
class DicionarioController extends GetxController {
  final DicionarioService dicionarioService;

  /// Construtor da classe para realizar injeções de dependências.
  ///
  /// Controlador da página [DicionarioPage].
  DicionarioController({
    required this.dicionarioService,
  });

  late final RxList<NoDicionarioModel> listaDicionario;
  late final Rx<String> textoPesquisa;
  late final Rx<OrdemArvoreBinaria> ordenacao;

  @override
  void onInit() async {
    listaDicionario = <NoDicionarioModel>[].obs;
    textoPesquisa = "".obs;
    ordenacao = OrdemArvoreBinaria.emOrdem.obs;

    listaDicionario.value = await dicionarioService.inicializarDicionario();
    super.onInit();
  }

  Future<void> exibirDialogoInserir() async {
    await Get.dialog(
      const InserirPalavraDicionarioComponent(),
    );
  }

  Future<void> inserir(String palavra, String significado) async {
    final novaPalavra = NoDicionarioModel(
      palavra: palavra,
      significado: significado,
    );

    final retorno = await dicionarioService.inserir(novaPalavra);
    listaDicionario.value = retorno;

    fecharOverlays();
    exibirToast("Palavra inserida com sucesso.");
  }

  Future<void> alterarModoPesquisa(OrdemArvoreBinaria? ordenacao) async {
    if (ordenacao == null) {
      return;
    }

    this.ordenacao.value = ordenacao;

    final retorno = await _obter(
      ordenacao: ordenacao,
    );

    listaDicionario.value = retorno;
  }

  Future<void> pesquisar(String? value) async {
    if (value == null) {
      return;
    }

    textoPesquisa.value = value;

    final retorno = await _obter(
      pesquisa: value,
    );

    listaDicionario.value = retorno;
  }

  Future<void> remover(NoDicionarioModel palavra) async {
    final retorno = await dicionarioService.remover(palavra);
    listaDicionario.value = retorno;
    
    exibirToast("Palavra removida com sucesso.");
  }

  void fecharOverlays() {
    Navigation.voltar(
      fecharOverlays: true,
    );
  }

  void exibirToast(String mensagem) {
    Get.showSnackbar(
      GetSnackBar(
        message: mensagem,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<List<NoDicionarioModel>> _obter({
    String? pesquisa,
    OrdemArvoreBinaria? ordenacao,
  }) async {
    final retorno = await dicionarioService.obter(
      pesquisa: pesquisa,
      ordenacao: ordenacao,
    );
    return retorno;
  }
}
