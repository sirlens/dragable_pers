class Item {
  Item({
    required this.itemId,
    required this.groupId,
    required this.name,
    required this.unitPrice,
    required this.stock,
    required this.stockComprometido,
    required this.stockDisponible,
    required this.afectoImpCode,
    required this.porcentajeImpuesto,
    required this.esAplicableDescuento,
  });

  final String itemId;
  final int? groupId;
  final String? name;
  final double? unitPrice;
  final double? stock;
  double? stockComprometido;
  double? stockDisponible;
  final String? afectoImpCode;
  final double? porcentajeImpuesto;
  final bool? esAplicableDescuento;

  factory Item.fromJson(Map<String, dynamic> json) {
    
    return Item(
      itemId: json['itemId'] as String,
      groupId: json['groupId'] as int,
      name: json['name'] as String,
      unitPrice: 0.0,
      stock: (json['stock'] as num?)?.toDouble() ?? 0.0,
      stockComprometido: (json['stockComprometido'] as num?)?.toDouble() ?? 0.0,
      stockDisponible: (json['stockDisponible'] as num?)?.toDouble() ?? 0.0,
      afectoImpCode: json['afectoImpCode'],
      porcentajeImpuesto: double.tryParse(json['porcentajeImpuesto'].toString()) ?? 0.0,
      esAplicableDescuento: json["esAplicableDescuento"] ?? false,
    );
  }


  Map<String, dynamic> toJson() => {
        "itemId": itemId,
        "groupId": groupId,
        "name": name,
        "unitPrice": unitPrice,
        "stock": stock,
        "afectoImpCode": afectoImpCode,
        "porcentajeImpuesto": porcentajeImpuesto,
        "esAplicableDescuento": esAplicableDescuento,
      };

}
