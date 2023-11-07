import 'package:get/get.dart';
import 'package:software2/_iatech/domain/models/options_model.dart';
import 'package:software2/_iatech/presentation/register_candidate/view/register_pg.dart';
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
        Get.to(() => RegisterPage());
      }),
      OptionsModel('Gestionar Solicitudes', Res.images.getRequest, () {
        Get.to(() => RegisterPage());
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
        Get.to(() => RegisterPage());
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
