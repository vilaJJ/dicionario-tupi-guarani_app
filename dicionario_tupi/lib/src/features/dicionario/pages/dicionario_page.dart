import 'package:dicionario_tupi/src/features/dicionario/components/list_view/lista_palavras_dicionario_component.dart';
import 'package:dicionario_tupi/src/features/dicionario/components/rows/search_row_dicionario_component.dart';
import 'package:dicionario_tupi/src/features/dicionario/controllers/dicionario_controller.dart';
import 'package:dicionario_tupi/src/shared/helpers/dimensoes_tela/dimensoes_tela_helper.dart';
import 'package:dicionario_tupi/src/shared/widgets/appbar/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DicionarioPage extends StatefulWidget {
  const DicionarioPage({super.key});

  @override
  State<DicionarioPage> createState() => _DicionarioPageState();
}

class _DicionarioPageState extends State<DicionarioPage> {
  late final DicionarioController controller;

  @override
  void initState() {
    controller = Get.find<DicionarioController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Padding(
        padding: EdgeInsets.only(
          top: DimensoesTelaHelper.of(context).obterAltura(
            percentual: 0.01,
          ),
          left: 16,
          right: 16,
        ),
        child: const Column(
          children: [
            SearchRowDicionarioComponent(),
            ListaPalavrasDicionarioComponent(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Inserir palavra",
        onPressed: controller.exibirDialogoInserir,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
