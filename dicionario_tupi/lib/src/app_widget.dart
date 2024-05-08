import 'package:dicionario_tupi/src/shared/navigation/bindings/navigation_bindings.dart';
import 'package:dicionario_tupi/src/shared/navigation/pages/navigation_pages.dart';
import 'package:dicionario_tupi/src/shared/navigation/routes/navigation_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';

/// Ponto inicial da aplicação.
///
/// [Widget] de configuração geral da aplicação.
class AppWidget extends StatelessWidget {
  /// Construtor da classe.
  ///
  /// Ponto inicial da aplicação.
  ///
  /// [Widget] de configuração geral da aplicação.
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('pt-br'),
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Dicionário Tupi',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 111, 187, 198),
        ),
      ),
      defaultTransition: NavigationPages.transicaoPadrao,
      getPages: NavigationPages.paginas,
      initialRoute: NavigationRoutes.inicial,
      initialBinding: NavigationBindings.inicial,
      smartManagement: SmartManagement.full,
    );
  }
}
