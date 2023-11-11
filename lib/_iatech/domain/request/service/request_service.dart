import 'package:software2/_iatech/domain/register/model/aspirante_model.dart';
import 'package:software2/_iatech/domain/request/interface/i_request.dart';

class RequestService {
  final IRequest iRequest;

  RequestService(this.iRequest);

  Future<List<Candidate>> getRequest(String search) async {
    return await iRequest.getRequest(search);
  }

  Future<bool> deeltedRequest({required String id}) async {
    return await iRequest.deeltedRequest(id: id);
  }

  Future<bool> updateRequest({required Candidate candidate}) async {
    return await iRequest.updateRequest(candidate: candidate);
  }
}
