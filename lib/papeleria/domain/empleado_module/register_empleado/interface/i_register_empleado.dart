import '../model/empleado_model.dart';

abstract class IRegisterEmpleado {
  Future<bool> registerEmpleado(Empleado empleado);
}
