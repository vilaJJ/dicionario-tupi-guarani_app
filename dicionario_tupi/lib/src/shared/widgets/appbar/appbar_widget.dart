import 'package:dicionario_tupi/src/shared/helpers/dimensoes_tela/dimensoes_tela_helper.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.menu_book_rounded,
            color: Theme.of(context).primaryColorDark,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: DimensoesTelaHelper.of(context).obterLargura(percentual: 0.01),
            ),
            child: const Text("Dicionário Tupi"),
          ),
        ],
      ),
    );
  }
}
