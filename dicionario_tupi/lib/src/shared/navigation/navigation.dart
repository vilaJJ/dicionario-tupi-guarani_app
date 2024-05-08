import 'package:get/route_manager.dart';

/// Classe responsável pela navegação entre as páginas do aplicativo.
class Navigation {
  /// Construtor privado.
  ///
  /// Classe responsável pela navegação entre as páginas do aplicativo.
  Navigation._();

  /// Navega até a rota informada, informando os [argumentos].
  static Future<void> irPara(
    String rota, {
    dynamic argumentos,
  }) async {
    await Get.toNamed(
      rota,
      arguments: argumentos,
    );
  }

  /// Navega até a rota informada, removendo toda a pilha de navegação anterior,
  /// informando os [argumentos].
  static Future<void> irParaRemovendoAnteriores(
    String rota, {
    dynamic argumentos,
  }) async {
    await Get.offAllNamed(
      rota,
      arguments: argumentos,
    );
  }

  /// Encerra a tela atual, e retorna para a rota anterior.
  static void voltar({
    bool fecharOverlays = false,
  }) {
    Get.back(
      closeOverlays: fecharOverlays,
    );
  }
}
