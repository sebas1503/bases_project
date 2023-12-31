class ProductsByInInventoryReporte1Model {
  int? idProducto;
  String? producto;
  int? cantidadDisponible;

  ProductsByInInventoryReporte1Model({
    this.idProducto,
    this.producto,
    this.cantidadDisponible,
  });

  factory ProductsByInInventoryReporte1Model.fromJson(
          Map<dynamic, dynamic> json) =>
      ProductsByInInventoryReporte1Model(
        idProducto: json['idProducto'],
        producto: json['producto'],
        cantidadDisponible: json['cantidadDisponible'],
      );

  Map<String, dynamic> toJson() {
    return {
      'idProducto': idProducto,
      'producto': producto,
      'cantidadDisponible': cantidadDisponible,
    };
  }
}
