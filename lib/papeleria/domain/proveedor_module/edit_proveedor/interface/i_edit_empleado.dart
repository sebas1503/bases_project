import 'package:software2/papeleria/domain/proveedor_module/register_proveedor/model/proveedor_model.dart';

abstract class IEditProveedor {
  Future<List<Proveedor>> getProveedor(String search);
  Future<bool> deleteProveedor({required String id});
  Future<bool> updateProveedor({required Proveedor proveedor});
}
