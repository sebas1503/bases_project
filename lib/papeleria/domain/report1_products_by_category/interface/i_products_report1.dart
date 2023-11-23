import 'package:software2/papeleria/domain/report1_products_by_category/model/products_report1_model.dart';

abstract class IProductByCategoryReport1 {
  Future<List<ProductsReporte1Model>> getProductsReport1(String categoria);
  Future<List<String>> getCategories();
}
