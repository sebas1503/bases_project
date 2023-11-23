class Product {
  int? idProduct;
  String? nombre;
  String? descripcion;
  int? precio;
  int? categoria;

  Product({
    this.idProduct,
    this.nombre,
    this.descripcion,
    this.precio,
    this.categoria,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        idProduct: json['idProducto'],
        nombre: json['nombre'],
        descripcion: json['descripcion'],
        precio: json['precio'],
        categoria: json['categoria'],
      );

  Map<String, dynamic> toJson() {
    return {
      'idProducto': idProduct,
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'categoria': categoria,
    };
  }
}
