import 'package:dicionario_tupi/src/features/dicionario/controllers/dicionario_controller.dart';
import 'package:dicionario_tupi/src/shared/enums/arvore_binaria/ordem_arvore_binaria_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdenacaoDropdownDicionarioComponent extends GetView<DicionarioController> {
  const OrdenacaoDropdownDicionarioComponent({super.key});

  @override
  Widget build(BuildContext context) {
    const lista = OrdemArvoreBinaria.values;
    final qntdItems = lista.length;
    return Obx(
      () {
        return DropdownButton<OrdemArvoreBinaria>(
          value: controller.ordenacao.value,
          isExpanded: true,
          focusColor: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          items: List.generate(
            qntdItems,
            (index) {
              final item = lista[index];

              return DropdownMenuItem(
                value: item,
                child: Text(item.nome),
              );
            },
          ),
          onChanged: controller.alterarModoPesquisa,
        );
      },
    );
  }
}
