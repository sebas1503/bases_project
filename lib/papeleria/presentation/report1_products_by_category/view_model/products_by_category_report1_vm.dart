import 'package:get/get.dart';
import 'package:software2/papeleria/domain/report1_products_by_category/model/products_report1_model.dart';
import 'package:software2/papeleria/domain/report1_products_by_category/service/products_by_category_report1_service.dart';
import 'package:software2/papeleria/infraestructure/report1_products_by_category/products_by_category_repo.dart';

class ProductsByCategoryReport1ViewModel extends GetxController {
  final ProductsByCategoryReportService productsByCategoryReportService =
      ProductsByCategoryReportService(
          iProductsByCategoryReport1: ProductsByCategoryRepository());
  RxList<String> categories = <String>[].obs;
  RxString selectedCategory = ''.obs;
  RxList<ProductsReporte1Model> listProducts = <ProductsReporte1Model>[].obs;

  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    categories.value = await productsByCategoryReportService.getCategories();
    selectedCategory.value = categories[0];
  }

  Future<void> getProductsByCategory() async {
    listProducts.value = await productsByCategoryReportService
        .getProductsReport1(selectedCategory.value);
  }

  //lista de categorias para un dropdwonbutton

  static ProductsByCategoryReport1ViewModel get findOrInitialize {
    try {
      return Get.find<ProductsByCategoryReport1ViewModel>();
    } catch (e) {
      Get.put(ProductsByCategoryReport1ViewModel());
      return Get.find<ProductsByCategoryReport1ViewModel>();
    }
  }
}
