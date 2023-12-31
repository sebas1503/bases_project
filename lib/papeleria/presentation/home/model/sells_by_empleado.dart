class SellsByEmpleadoModel {
  int? idEmpleado;
  String? nombreEmpleado;
  int? numeroDeVentas;

  SellsByEmpleadoModel({
    this.idEmpleado,
    this.nombreEmpleado,
    this.numeroDeVentas,
  });

  factory SellsByEmpleadoModel.fromJson(Map<dynamic, dynamic> json) =>
      SellsByEmpleadoModel(
        idEmpleado: json['idEmpleado'],
        nombreEmpleado: json['nombreEmpleado'],
        numeroDeVentas: json['numeroDeVentas'],
      );

  Map<String, dynamic> toJson() {
    return {
      'idEmpleado': idEmpleado,
      'nombreEmpleado': nombreEmpleado,
      'numeroDeVentas': numeroDeVentas,
    };
  }
}
