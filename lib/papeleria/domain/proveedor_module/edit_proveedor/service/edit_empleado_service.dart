import 'package:software2/papeleria/domain/proveedor_module/edit_proveedor/interface/i_edit_empleado.dart';
import 'package:software2/papeleria/domain/proveedor_module/register_proveedor/model/proveedor_model.dart';

class EditProveedorService {
  final IEditProveedor iEditProveedor;

  EditProveedorService(this.iEditProveedor);

  Future<List<Proveedor>> getProveedor(String search) async {
    return await iEditProveedor.getProveedor(search);
  }

  Future<bool> deleteProveedor({required String id}) async {
    return await iEditProveedor.deleteProveedor(id: id);
  }

  Future<bool> updateProveedor({required Proveedor proveedor}) async {
    return await iEditProveedor.updateProveedor(proveedor: proveedor);
  }
}
