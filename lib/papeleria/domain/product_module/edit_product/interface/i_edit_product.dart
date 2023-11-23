import 'package:software2/papeleria/domain/product_module/register_product/model/product_model.dart';

abstract class IEditProduct {
  Future<List<Product>> getProduct(String search);
  Future<bool> deleteProduct({required String id});
  Future<bool> updateProduct({required Product product});
}
