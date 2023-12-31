class SellsByClientModel {
  int? idCliente;
  String? nombreCliente;
  int? numeroDeVentas;

  SellsByClientModel({
    this.idCliente,
    this.nombreCliente,
    this.numeroDeVentas,
  });

  factory SellsByClientModel.fromJson(Map<dynamic, dynamic> json) =>
      SellsByClientModel(
        idCliente: json['idCliente'],
        nombreCliente: json['nombreCliente'],
        numeroDeVentas: json['numeroDeVentas'],
      );

  Map<String, dynamic> toJson() {
    return {
      'idCliente': idCliente,
      'nombreCliente': nombreCliente,
      'numeroDeVentas': numeroDeVentas,
    };
  }
}
