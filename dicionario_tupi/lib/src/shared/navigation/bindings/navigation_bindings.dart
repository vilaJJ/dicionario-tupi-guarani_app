import 'package:dicionario_tupi/src/features/dicionario/bindings/dicionario_binding.dart';
import 'package:dicionario_tupi/src/features/dicionario/controllers/dicionario_controller.dart';
import 'package:get/instance_manager.dart';

/// Classe com os _bindings_ que são injetados nas rotas de navegação do aplicativo.
class NavigationBindings {
  /// Construtor privado da classe.
  ///
  /// Classe com os _bindings_ que são injetados nas rotas de navegação do aplicativo.
  NavigationBindings._();

  /// _Binding_ inicial da aplicação.
  ///
  /// OBS: Temporariamente definido como [dicionario].
  static Bindings get inicial => dicionario;

  /// _Binding_ do controlador [DicionarioController].
  static Bindings get dicionario => DicionarioBinding();
}
