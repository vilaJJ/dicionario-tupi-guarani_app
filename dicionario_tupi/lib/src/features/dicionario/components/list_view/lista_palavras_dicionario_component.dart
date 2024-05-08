import 'package:dicionario_tupi/src/features/dicionario/controllers/dicionario_controller.dart';
import 'package:dicionario_tupi/src/shared/helpers/dimensoes_tela/dimensoes_tela_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListaPalavrasDicionarioComponent extends GetView<DicionarioController> {
  const ListaPalavrasDicionarioComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final listaDicionario = controller.listaDicionario.toList();
      final qntdItems = listaDicionario.length;

      return Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: qntdItems,
          itemBuilder: (context, index) {
            final palavra = listaDicionario[index];

            return Padding(
              padding: EdgeInsets.only(
                bottom: index + 1 == qntdItems
                    ? DimensoesTelaHelper.of(context).obterAltura(
                        percentual: 0.1,
                      )
                    : 0,
              ),
              child: ListTile(
                isThreeLine: true,
                style: ListTileStyle.drawer,
                titleAlignment: ListTileTitleAlignment.center,
                leading: Text(
                  "${index + 1}. ",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                title: Text(palavra.palavra),
                subtitle: Text(palavra.significado),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red.shade300,
                  ),
                  onPressed: () {
                    controller.remover(palavra);
                  },
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
