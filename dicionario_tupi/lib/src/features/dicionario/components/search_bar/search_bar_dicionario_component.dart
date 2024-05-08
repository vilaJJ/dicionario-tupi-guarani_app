import 'package:dicionario_tupi/src/features/dicionario/controllers/dicionario_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarDicionarioComponent extends GetView<DicionarioController> {
  const SearchBarDicionarioComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Pesquisa',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        prefixIcon: const Icon(Icons.text_fields_rounded),
      ),
      onChanged: controller.pesquisar,
    );
  }
}
