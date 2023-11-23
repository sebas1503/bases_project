import 'package:software2/papeleria/domain/empleado_module/edit_empleado/interface/i_edit_empleado.dart';

import '../../register_empleado/model/empleado_model.dart';

class EditEmpleadoService {
  final IEditEmpleado iEditEmpleado;

  EditEmpleadoService(this.iEditEmpleado);

  Future<List<Empleado>> getEmpleados(String search) async {
    return await iEditEmpleado.getEmpleados(search);
  }

  Future<bool> deleteEmpleado({required String id}) async {
    return await iEditEmpleado.deleteEmpleado(id: id);
  }

  Future<bool> updateEmpleado({required Empleado empleado}) async {
    return await iEditEmpleado.updateEmpleado(empleado: empleado);
  }
}
