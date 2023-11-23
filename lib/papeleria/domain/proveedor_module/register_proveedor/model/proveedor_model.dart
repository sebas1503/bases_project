class Proveedor {
  int? idProveedor;
  String? nombreUno;
  String? nombreDos;
  String? apellidoUno;
  String? apellidoDos;
  String? direccion;
  int? idUsuario;
  int? idEmpresa;

  Proveedor(
      {this.idProveedor,
      this.nombreUno,
      this.nombreDos,
      this.apellidoUno,
      this.apellidoDos,
      this.direccion,
      this.idUsuario,
      this.idEmpresa});

  factory Proveedor.fromJson(Map<String, dynamic> json) => Proveedor(
      idProveedor: json['idProvedor'],
      nombreUno: json['nombreUno'],
      nombreDos: json['nombreDos'],
      apellidoUno: json['apellidoUno'],
      apellidoDos: json['apellidoDos'],
      //direccion: json['direccion'],
      idUsuario: json['idUsuario'],
      idEmpresa: json['empresa']);

  Map<String, dynamic> toJson() {
    return {
      'idProvedor': idProveedor,
      'nombreUno': nombreUno,
      'nombreDos': nombreDos,
      'apellidoUno': apellidoUno,
      'apellidoDos': apellidoDos,
      // 'direccion': direccion,
      'idUsuario': idUsuario,
      'empresa': idEmpresa,
    };
  }
}
