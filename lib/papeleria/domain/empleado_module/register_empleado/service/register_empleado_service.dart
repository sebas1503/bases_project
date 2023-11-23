import '../interface/i_register_empleado.dart';
import '../model/empleado_model.dart';

class RegisterEmpleadoService {
  final IRegisterEmpleado iRegisterEmpleado;

  RegisterEmpleadoService({required this.iRegisterEmpleado});

  Future<bool> registerEmpleado(Empleado empleado) async {
    return await iRegisterEmpleado.registerEmpleado(empleado);
  }
}
