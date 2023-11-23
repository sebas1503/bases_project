import 'package:software2/papeleria/domain/product_module/edit_product/interface/i_edit_product.dart';

import '../../register_product/model/product_model.dart';

class EditProductService {
  final IEditProduct iEditProduct;

  EditProductService(this.iEditProduct);

  Future<List<Product>> getProduct(String search) async {
    return await iEditProduct.getProduct(search);
  }

  Future<bool> deleteProduct({required String id}) async {
    return await iEditProduct.deleteProduct(id: id);
  }

  Future<bool> updatProduct({required Product product}) async {
    return await iEditProduct.updateProduct(product: product);
  }
}
