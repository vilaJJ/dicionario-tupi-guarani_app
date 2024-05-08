import 'package:dicionario_tupi/src/features/dicionario/controllers/dicionario_controller.dart';
import 'package:dicionario_tupi/src/shared/services/arquivos/arquivos_service.dart';
import 'package:dicionario_tupi/src/shared/services/arvore_binaria/dicionario/dicionario_arvore_binaria_service.dart';
import 'package:dicionario_tupi/src/shared/services/dicionario/dicionario_service.dart';
import 'package:get/instance_manager.dart';

/// _Binding_ para realizar injeções de dependências no controlador [DicionarioController].
class DicionarioBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DicionarioController>(
      DicionarioController(
        dicionarioService: DicionarioService(
          arquivosService: ArquivosService(),
          arvoreBinariaService: DicionarioArvoreBinariaService(),
        ),
      ),
    );
  }
}
