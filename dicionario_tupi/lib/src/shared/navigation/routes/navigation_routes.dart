import 'package:dicionario_tupi/src/features/dicionario/pages/dicionario_page.dart';

/// Classe com as rotas de navegação do aplicativo.
class NavigationRoutes {
  /// Construtor privado da classe.
  ///
  /// Classe com as rotas de navegação do aplicativo.
  NavigationRoutes._();

  /// Rota inicial da aplicação.
  ///
  /// OBS: Temporariamente definida como [dicionario].
  static const inicial = dicionario;

  /// Rota para a página [DicionarioPage].
  static const dicionario = '/dicionario';
}
