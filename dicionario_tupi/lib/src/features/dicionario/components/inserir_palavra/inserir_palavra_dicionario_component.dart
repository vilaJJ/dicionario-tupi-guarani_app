import 'package:dicionario_tupi/src/features/dicionario/controllers/dicionario_controller.dart';
import 'package:dicionario_tupi/src/shared/helpers/dimensoes_tela/dimensoes_tela_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InserirPalavraDicionarioComponent extends StatefulWidget {
  const InserirPalavraDicionarioComponent({super.key});

  @override
  State<InserirPalavraDicionarioComponent> createState() => _InserirPalavraDicionarioComponentState();
}

class _InserirPalavraDicionarioComponentState extends State<InserirPalavraDicionarioComponent> {
  late final DicionarioController controller;
  late final GlobalKey<FormState> formKey;

  String palavra = "";
  String significado = "";

  @override
  void initState() {
    controller = Get.find<DicionarioController>();
    formKey = GlobalKey();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: AlertDialog(
        title: const Text("Inserir palavra"),
        content: SizedBox(
          width: DimensoesTelaHelper.of(context).obterLargura(percentual: 0.95),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                onChanged: (value) => palavra = value,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Insira uma palavra válida';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Palavra',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.key_rounded),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                onChanged: (value) => significado = value,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Insira um significado válido';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Significado',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.text_fields_rounded),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final isValido = formKey.currentState?.validate();

              if (isValido == true) {
                await controller.inserir(palavra, significado);
              }
            },
            child: const Text("Inserir"),
          ),
          TextButton(
            onPressed: controller.fecharOverlays,
            child: const Text("Cancelar"),
          ),
        ],
      ),
    );
  }
}
