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
      idClient: json['idClient'],
      nombreUno: json['nombreUno'],
      nombreDos: json['nombreDos'],
      apellidoUno: json['apellidoUno'],
      apellidoDos: json['apellidoDos'],
      direccion: json['direccion'],
      idUsuario: json['idUsuario']);

  Map<String, dynamic> toJson() {
    return {
      'idClient': idClient,
      'nombreUno': nombreUno,
      'nombreDos': nombreDos,
      'apellidoUno': apellidoUno,
      'apellidoDos': apellidoDos,
      'direccion': direccion,
      'idUsuario': idUsuario
    };
  }
}
