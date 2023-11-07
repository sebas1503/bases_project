import 'package:software2/_iatech/domain/register/interface/i_register.dart';
import 'package:software2/_iatech/domain/register/model/aspirante_model.dart';

class RegisterService {
  final IRegister iRegister;

  RegisterService({required this.iRegister});

  Future<bool> registerUser(Candidate candidate) async {
    return await iRegister.registerUser(candidate);
  }
}
