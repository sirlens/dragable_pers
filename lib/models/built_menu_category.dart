
import 'package:dragable_pers/models/main_category.dart';
import 'package:dragable_pers/models/sub_category.dart';

class BuiltMenuCategory {
  BuiltMenuCategory({
    required this.mainCategory,
    required this.subCategories,
  });

  final MainCategory mainCategory;
  final List<SubCategory> subCategories;
}