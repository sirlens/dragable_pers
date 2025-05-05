class SubCategory {
  SubCategory({
    required this.subCategoryId,
    required this.description,
  });

  final String subCategoryId;
  final String? description;

  SubCategory copyWith({
    required String subCategoryId,
    String? description,
  }) {
    return SubCategory(
      subCategoryId: subCategoryId,
      description: description ?? this.description,
    );
  }

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      subCategoryId: json["subCategoryId"],
      description: json["description"],
    );
  }
  
  Map<String, dynamic> toJson() => {
        "subCategoryId": subCategoryId,
        "description": description,
      };
}