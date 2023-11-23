import 'package:software2/papeleria/domain/report1_products_by_category/interface/i_products_report1.dart';
import 'package:software2/papeleria/domain/report1_products_by_category/model/products_report1_model.dart';

class ProductsByCategoryReportService {
  final IProductByCategoryReport1 iProductsByCategoryReport1;

  ProductsByCategoryReportService({required this.iProductsByCategoryReport1});

  Future<List<ProductsReporte1Model>> getProductsReport1(
      String categoria) async {
    return await iProductsByCategoryReport1.getProductsReport1(categoria);
  }

  Future<List<String>> getCategories() async {
    return await iProductsByCategoryReport1.getCategories();
  }
}
