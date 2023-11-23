class Empleado {
  int? idEmpleado;
  String? nombreUno;
  String? nombreDos;
  String? apellidoUno;
  String? apellidoDos;
  String? direccion;
  int? idUsuario;

  Empleado(
      {this.idEmpleado,
      this.nombreUno,
      this.nombreDos,
      this.apellidoUno,
      this.apellidoDos,
      this.direccion,
      this.idUsuario});

  factory Empleado.fromJson(Map<String, dynamic> json) => Empleado(
      idEmpleado: json['idEmpleado'],
      nombreUno: json['nombreUno'],
      nombreDos: json['nombreDos'],
      apellidoUno: json['apellidoUno'],
      apellidoDos: json['apellidoDos'],
      //direccion: json['direccion'],
      idUsuario: json['idUsuario']);

  Map<String, dynamic> toJson() {
    return {
      'idEmpleado': idEmpleado,
      'nombreUno': nombreUno,
      'nombreDos': nombreDos,
      'apellidoUno': apellidoUno,
      'apellidoDos': apellidoDos,
      // 'direccion': direccion,
      'idUsuario': idUsuario
    };
  }
}
