class ProductsReporte1Model {
  String? nombreProducto;
  String? descripcion;
  int? precio;
  String? categoria;

  ProductsReporte1Model({
    this.nombreProducto,
    this.descripcion,
    this.precio,
    this.categoria,
  });

  factory ProductsReporte1Model.fromJson(Map<dynamic, dynamic> json) =>
      ProductsReporte1Model(
        nombreProducto: json['nombreProducto'],
        descripcion: json['descripcion'],
        precio: json['precio'],
        categoria: json['categoria'],
      );

  Map<String, dynamic> toJson() {
    return {
      'nombreProducto': nombreProducto,
      'descripcion': descripcion,
      'precio': precio,
      'categoria': categoria,
    };
  }
}
