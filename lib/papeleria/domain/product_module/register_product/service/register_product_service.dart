import '../interface/i_register_product.dart';
import '../model/product_model.dart';

class RegisterProductService {
  final IRegisterProduct iRegisterProduct;

  RegisterProductService({required this.iRegisterProduct});

  Future<bool> registerProduct(Product product) async {
    return await iRegisterProduct.registerProduct(product);
  }
}
