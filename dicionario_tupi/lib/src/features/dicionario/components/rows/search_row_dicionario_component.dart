import 'package:dicionario_tupi/src/features/dicionario/components/dropdown/ordenacao_dropdown_dicionario_component.dart';
import 'package:dicionario_tupi/src/features/dicionario/components/search_bar/search_bar_dicionario_component.dart';
import 'package:flutter/material.dart';

class SearchRowDicionarioComponent extends StatelessWidget {
  const SearchRowDicionarioComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SearchBarDicionarioComponent(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
        ),
        SizedBox(
          width: 125,
          child: OrdenacaoDropdownDicionarioComponent(),
        ),
      ],
    );
  }
}
