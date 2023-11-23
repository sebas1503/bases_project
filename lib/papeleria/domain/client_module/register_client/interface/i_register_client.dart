import '../model/client_model.dart';

abstract class IRegisterClient {
  Future<bool> registerClient(Client client);
}
