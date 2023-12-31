class ComparativeMonthsReporte2Model {
  String? anio;
  String? mes;
  int? ventasTotales;

  ComparativeMonthsReporte2Model({
    this.anio,
    this.mes,
    this.ventasTotales,
  });

  factory ComparativeMonthsReporte2Model.fromJson(Map<dynamic, dynamic> json) =>
      ComparativeMonthsReporte2Model(
        anio: json['anio'],
        mes: json['mes'],
        ventasTotales: json['ventasTotales'],
      );

  Map<String, dynamic> toJson() {
    return {
      'anio': anio,
      'mes': mes,
      'ventasTotales': ventasTotales,
    };
  }
}
