import 'dart:async';
import 'package:dragable_pers/models/built_menu_category.dart';
import 'package:dragable_pers/models/item_entity.dart';
import 'package:dragable_pers/models/main_category.dart';
import 'package:dragable_pers/models/menu_response.dart';
import 'package:dragable_pers/models/sub_category.dart';
import 'package:flutter/material.dart';

class ItemsListProvider extends ChangeNotifier {
  List<Item> _listItems = [];
  List<Item> get listItems => _listItems;

  bool _isRefresh = false;
  bool get isRefresh => _isRefresh;
  set isRefresh(bool value) {
    _isRefresh = value;
    notifyListeners();
  }

  int _selectedItem = 0;
  int get selectedItem => _selectedItem;
  set selectedItem(int isSelected) {
    _selectedItem = isSelected;
    notifyListeners();
  }

  Future<void> loadItems() async {
    Item nuevoItem = Item(
      itemId: 'itemId',
      groupId: 1,
      name: 'Item Name',
      unitPrice: 100.0,
      stock: 10.0,
      stockComprometido: 5.0,
      stockDisponible: 5.0,
      afectoImpCode: 'A',
      porcentajeImpuesto: 18.0,
      esAplicableDescuento: true,
    );

    // Simular una carga de datos
    await Future.delayed(const Duration(seconds: 2));

    // Agregar el nuevo item a la lista
    _listItems.add(nuevoItem);
  }

    Future<void> getItemsBySubCategory(String idSubFamilia) async {

    _listItems.clear();

    await loadItems();
  }

  List<MainCategory> _listMainCatTemp = [];
  List<MainCategory> _listMainCat = [];
  get listMainCat => _listMainCat;
  final Map<String, BuiltMenuCategory> _menuCache = {};

  Future<void> loadMainCategory() async {
    if (_listMainCatTemp.isNotEmpty) {
      _listMainCat = List.from(_listMainCatTemp);
      _builtMenu.clear();
      _builtMenu.addAll(
        _listMainCatTemp.map(
          (mainCat) =>
              _menuCache[mainCat.categoryId] ??
              BuiltMenuCategory(mainCategory: mainCat, subCategories: []),
        ),
      );
      return;
    }

    _builtMenu.clear();

    MenuResponse unMenuResponse = MenuResponse(
      categoryId: '0',
      description: 'TODOS',
      listaSubCategorias: [
        SubCategory(subCategoryId: '1', description: 'SubCategory 1'),
      ],
    );

    List<MenuResponse> menuResponse = [unMenuResponse];

    final MainCategory mainCatTodos = MainCategory(
      categoryId: '0',
      description: 'TODOS',
    );
    _listMainCat = [mainCatTodos];
    _builtMenu.add(
      BuiltMenuCategory(mainCategory: mainCatTodos, subCategories: []),
    );

    // Procesar el resto de categorías
    for (var menu in menuResponse) {
      final mainCategory = menu.toMainCategory();
      _listMainCat.add(mainCategory);

      final builtMenu = BuiltMenuCategory(
        mainCategory: mainCategory,
        subCategories: menu.listaSubCategorias,
      );
      _builtMenu.add(builtMenu);
      _menuCache[mainCategory.categoryId] = builtMenu;
    }

    _listMainCatTemp = List.from(_listMainCat);
    notifyListeners();
  }

  final List<BuiltMenuCategory> _builtMenu = [];
  List<BuiltMenuCategory> get builtMenu => _builtMenu;

  Future<List<SubCategory>> loadSubcategoriesByMainCategory(String id) async {
    SubCategory subCategory1 = SubCategory(
      subCategoryId: '0',
      description: 'subCategory1',
    );
    final reS = [subCategory1];
    return reS;
  }
}
