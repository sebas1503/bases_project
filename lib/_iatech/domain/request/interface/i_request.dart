import 'package:software2/_iatech/domain/register/model/aspirante_model.dart';

abstract class IRequest {
  Future<List<Candidate>> getRequest();
}
