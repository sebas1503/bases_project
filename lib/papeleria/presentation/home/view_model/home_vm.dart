import 'package:get/get.dart';
import 'package:software2/papeleria/domain/home/models/options_model.dart';
import 'package:software2/papeleria/presentation/client_module/register_client/view/register_client_pg.dart';
import 'package:software2/shared/assets/assets.dart';
import 'package:software2/shared/colors/colors.dart';

class HomeViewModel extends GetxController {
  RxList<OptionsModel> options = <OptionsModel>[].obs;

  static HomeViewModel get findOrInitialize {
    try {
      return Get.find<HomeViewModel>();
    } catch (e) {
      Get.put(HomeViewModel());
      return Get.find<HomeViewModel>();
    }
  }

  void fullOptions() {
    options.value = [
      OptionsModel('Registrar Candidato', Res.images.addPerson, () {
        Get.to(() => RegisterClientPage());
      }),
      OptionsModel('Gestionar Solicitudes', Res.images.getRequest, () {
        // Get.to(() => RequestPage());
      }),
      OptionsModel('Programar Entrevistas', Res.images.programateDate, () {
        Get.snackbar('Modulo en Construccion', 'Pronto estara disponible',
            backgroundColor: ConstColors.primaryColor, duration: 3.seconds);
      }),
      OptionsModel('Gestionar Resultados de Entrevista', Res.images.gestResult,
          () {
        Get.snackbar('Modulo en Construccion', 'Pronto estara disponible',
            backgroundColor: ConstColors.primaryColor, duration: 3.seconds);
      }),
      OptionsModel('Gestionar Referencias', Res.images.references, () {
        Get.snackbar('Modulo en Construccion', 'Pronto estara disponible',
            backgroundColor: ConstColors.primaryColor, duration: 3.seconds);
      }),
      OptionsModel(
          'Verificar Antecedentes de Candidato', Res.images.antecedentes, () {
        Get.to(() => RegisterClientPage());
      }),
      OptionsModel('Generar oferta de empleo', Res.images.oferts, () {
        Get.snackbar('Modulo en Construccion', 'Pronto estara disponible',
            backgroundColor: ConstColors.primaryColor, duration: 3.seconds);
      }),
      OptionsModel('Gestionar Contratos', Res.images.contrato, () {
        Get.snackbar('Modulo en Construccion', 'Pronto estara disponible',
            backgroundColor: ConstColors.primaryColor, duration: 3.seconds);
      }),
    ];
  }
}
