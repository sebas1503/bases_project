import '../model/proveedor_model.dart';

abstract class IRegisterProveedor {
  Future<bool> registerProveedor(Proveedor proveedor);
}
