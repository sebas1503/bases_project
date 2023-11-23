import '../../register_client/model/client_model.dart';

abstract class IEditClient {
  Future<List<Client>> getClients(String search);
  Future<bool> deleteClient({required String id});
  Future<bool> updateClient({required Client client});
}
