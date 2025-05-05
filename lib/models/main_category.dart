class MainCategory {
  MainCategory({
    required this.categoryId,
    required this.description,
  });

  final String categoryId;
  final String? description;

  factory MainCategory.fromJson(Map<String, dynamic> json) {
    return MainCategory(
      categoryId: json["categoryId"],
      description: json["description"],
    );
  }
 
  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "description": description,
      };

}
