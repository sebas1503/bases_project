import 'package:software2/_iatech/domain/register/model/aspirante_model.dart';

abstract class IRegister {
  Future<bool> registerUser(Candidate candidate);
}
