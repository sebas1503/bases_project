import 'package:software2/papeleria/domain/client_module/edit_client/interface/i_edit_client.dart';

import '../../register_client/model/client_model.dart';

class EditClientService {
  final IEditClient iEditCliente;

  EditClientService(this.iEditCliente);

  Future<List<Client>> getClient(String search) async {
    return await iEditCliente.getClients(search);
  }

  Future<bool> deleteClient({required String id}) async {
    return await iEditCliente.deleteClient(id: id);
  }

  Future<bool> updateClient({required Client client}) async {
    return await iEditCliente.updateClient(client: client);
  }
}
