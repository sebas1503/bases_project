class CategoryBySellsModel {
  int? numeroDeVentas;
  String? categoria;
  int? idCategoriaProducto;

  CategoryBySellsModel({
    this.numeroDeVentas,
    this.categoria,
    this.idCategoriaProducto,
  });

  factory CategoryBySellsModel.fromJson(Map<dynamic, dynamic> json) =>
      CategoryBySellsModel(
        numeroDeVentas: json['numeroDeVentas'],
        categoria: json['categoria'],
        idCategoriaProducto: json['idCategoriaProducto'],
      );

  Map<String, dynamic> toJson() {
    return {
      'numeroDeVentas': numeroDeVentas,
      'categoria': categoria,
      'idCategoriaProducto': idCategoriaProducto,
    };
  }
}
