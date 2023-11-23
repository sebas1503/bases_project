class ProductsBySellsDiariesReporte1Model {
  String? fechaVenta;
  String? nombreCliente;
  String? apellidoCliente;
  String? nombreEmpleado;
  String? apellidoEmpleado;
  String? nombreProducto;
  int? cantidad;
  int? precioUnitario;

  ProductsBySellsDiariesReporte1Model({
    this.fechaVenta,
    this.nombreCliente,
    this.apellidoCliente,
    this.nombreEmpleado,
    this.apellidoEmpleado,
    this.nombreProducto,
    this.cantidad,
    this.precioUnitario,
  });

  factory ProductsBySellsDiariesReporte1Model.fromJson(
          Map<dynamic, dynamic> json) =>
      ProductsBySellsDiariesReporte1Model(
        fechaVenta: json['fechaVenta'],
        nombreCliente: json['nombreCliente'],
        apellidoCliente: json['apellidoCliente'],
        nombreEmpleado: json['nombreEmpleado'],
        apellidoEmpleado: json['apellidoEmpleado'],
        nombreProducto: json['nombreProducto'],
        cantidad: json['cantidad'],
        precioUnitario: json['precioUnitario'],
      );

  Map<String, dynamic> toJson() {
    return {
      'fechaVenta': fechaVenta,
      'nombreCliente': nombreCliente,
      'apellidoCliente': apellidoCliente,
      'nombreEmpleado': nombreEmpleado,
      'apellidoEmpleado': apellidoEmpleado,
      'nombreProducto': nombreProducto,
      'cantidad': cantidad,
      'precioUnitario': precioUnitario,
    };
  }
}
