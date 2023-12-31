class SellsByClientReporte2Model {
  int? idCliente;
  String? nombreCliente;
  String? apellidoCliente;
  String? fechaCompra;
  String? producto;
  int? cantidad;
  int? precioUnitario;

  SellsByClientReporte2Model({
    this.idCliente,
    this.nombreCliente,
    this.apellidoCliente,
    this.fechaCompra,
    this.producto,
    this.cantidad,
    this.precioUnitario,
  });

  factory SellsByClientReporte2Model.fromJson(Map<dynamic, dynamic> json) =>
      SellsByClientReporte2Model(
        idCliente: json['idCliente'],
        nombreCliente: json['nombreCliente'],
        apellidoCliente: json['apellidoCliente'],
        fechaCompra: json['fechaCompra'],
        producto: json['producto'],
        cantidad: json['cantidad'],
        precioUnitario: json['precioUnitario'],
      );

  Map<String, dynamic> toJson() {
    return {
      'idCliente': idCliente,
      'nombreCliente': nombreCliente,
      'apellidoCliente': apellidoCliente,
      'fechaCompra': fechaCompra,
      'producto': producto,
      'cantidad': cantidad,
      'precioUnitario': precioUnitario,
    };
  }
}
