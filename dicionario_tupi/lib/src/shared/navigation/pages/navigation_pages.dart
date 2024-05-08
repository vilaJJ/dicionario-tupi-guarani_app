import 'package:dicionario_tupi/src/features/dicionario/pages/dicionario_page.dart';
import 'package:dicionario_tupi/src/shared/navigation/bindings/navigation_bindings.dart';
import 'package:dicionario_tupi/src/shared/navigation/routes/navigation_routes.dart';
import 'package:get/route_manager.dart';

/// Classe com as páginas de navegação do aplicativo.
class NavigationPages {
  /// Construtor privado da classe.
  ///
  /// Classe com as páginas de navegação do aplicativo.
  NavigationPages._();

  /// Transição entre páginas padrão do aplicativo ([Transition.native]).
  static Transition get transicaoPadrao => Transition.native;

  /// Rota inicial da aplicação.
  ///
  /// OBS: Temporariamente definido como [_dicionario].
  static GetPage<dynamic> get _inicial => _dicionario;

  static GetPage<DicionarioPage> get _dicionario => GetPage(
        name: NavigationRoutes.dicionario,
        page: () => const DicionarioPage(),
        binding: NavigationBindings.dicionario,
      );

  /// Lista de [GetPage], onde possuí todas as rotas do aplicativo.
  static List<GetPage> get paginas => [
        _inicial,
        _dicionario,
      ];
}
