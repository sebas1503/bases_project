class Client {
  int? idClient;
  String? nombreUno;
  String? nombreDos;
  String? apellidoUno;
  String? apellidoDos;
  String? direccion;
  int? idUsuario;

  Client(
      {this.idClient,
      this.nombreUno,
      this.nombreDos,
      this.apellidoUno,
      this.apellidoDos,
      this.direccion,
      this.idUsuario});

  factory Client.fromJson(Map<String, dynamic> json) => Client(
      idClient: json['idCliente'],
      nombreUno: json['nombreUno'],
      nombreDos: json['nombreDos'],
      apellidoUno: json['apellidoUno'],
      apellidoDos: json['apellidoDos'],
      idUsuario: json['idUsuario']);

  Map<String, dynamic> toJson() {
    return {
      'idCliente': idClient,
      'nombreUno': nombreUno,
      'nombreDos': nombreDos,
      'apellidoUno': apellidoUno,
      'apellidoDos': apellidoDos,
      'idUsuario': idUsuario
    };
  }
}
