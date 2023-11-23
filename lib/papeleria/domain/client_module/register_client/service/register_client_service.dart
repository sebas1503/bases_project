import '../interface/i_register_client.dart';
import '../model/client_model.dart';

class RegisterClientService {
  final IRegisterClient iRegisterClient;

  RegisterClientService({required this.iRegisterClient});

  Future<bool> registerClient(Client client) async {
    return await iRegisterClient.registerClient(client);
  }
}
