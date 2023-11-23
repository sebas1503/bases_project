import '../../register_empleado/model/empleado_model.dart';

abstract class IEditEmpleado {
  Future<List<Empleado>> getEmpleados(String search);
  Future<bool> deleteEmpleado({required String id});
  Future<bool> updateEmpleado({required Empleado empleado});
}
