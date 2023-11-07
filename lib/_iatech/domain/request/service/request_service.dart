import 'package:software2/_iatech/domain/register/model/aspirante_model.dart';
import 'package:software2/_iatech/domain/request/interface/i_request.dart';

class RequestService {
  final IRequest iRequest;

  RequestService(this.iRequest);

  Future<List<Candidate>> getRequest() async {
    return await iRequest.getRequest();
  }
}
