import '../interface/i_register_proveedor.dart';
import '../model/proveedor_model.dart';

class RegisterProveedorService {
  final IRegisterProveedor iRegisterProveedor;

  RegisterProveedorService({required this.iRegisterProveedor});

  Future<bool> registerProveedor(Proveedor proveedor) async {
    return await iRegisterProveedor.registerProveedor(proveedor);
  }
}
