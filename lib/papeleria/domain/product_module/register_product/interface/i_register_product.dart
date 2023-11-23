import '../model/product_model.dart';

abstract class IRegisterProduct {
  Future<bool> registerProduct(Product product);
}
