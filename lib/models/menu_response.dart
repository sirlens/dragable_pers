
import 'package:dragable_pers/models/main_category.dart';
import 'package:dragable_pers/models/sub_category.dart';

class MenuResponse {
  MenuResponse({
    required this.categoryId,
    required this.description,
    required this.listaSubCategorias,
  });

  final String categoryId;
  final String? description;
  final List<SubCategory> listaSubCategorias;

  factory MenuResponse.fromJson(Map<String, dynamic> json) {
    return MenuResponse(
      categoryId: json["categoryId"],
      description: json["description"],
      listaSubCategorias: (json["listaSubCategorias"] as List).map((x) => SubCategory.fromJson(x)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "description": description,
        "listaSubCategorias": listaSubCategorias.map((x) => x.toJson()).toList(),
      };

  MainCategory toMainCategory() {
    return MainCategory(
      categoryId: categoryId,
      description: description,
    );
  }
}
