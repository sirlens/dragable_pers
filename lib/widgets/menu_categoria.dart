import 'package:dragable_pers/models/built_menu_category.dart';
import 'package:dragable_pers/models/sub_category.dart';
import 'package:dragable_pers/providers/items_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MenuMainCategoria extends StatefulWidget {
  final BuiltMenuCategory builtMenu;
  final int indiceSelected;

  const MenuMainCategoria({super.key, required this.builtMenu, required this.indiceSelected});

  @override
  State<MenuMainCategoria> createState() => _MenuMainCategoriaState();
}

class _MenuMainCategoriaState extends State<MenuMainCategoria> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main Category Item
        InkWell(
          onTap: () async {
            // If it's 'TODOS', just search all items
            if (widget.builtMenu.mainCategory.categoryId == '0') {
              await context.read<ItemsListProvider>().loadItems();

              context.read<ItemsListProvider>().selectedItem = widget.indiceSelected;
            } else {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            }
          },
          child: Builder(
            builder: (context) {
              final isSelected = context.select((ItemsListProvider provider) => provider.selectedItem == widget.indiceSelected);

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 35,
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.builtMenu.mainCategory.description ?? '',
                      style: TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis, fontWeight: FontWeight.w400, color: isSelected ?     Color.fromARGB(255, 228, 208, 55):     Color.fromARGB(255, 231, 7, 167),),
                    ),
                    // Only show expansion icon for non-'TODOS' categories
                    if (widget.builtMenu.mainCategory.categoryId != '0')
                      Icon(
                        _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        size: 20,
                      ),
                  ],
                ),
              );
            },
          ),
        ),
        // Subcategories
        if (_isExpanded && widget.builtMenu.subCategories.isNotEmpty)
          Column(
            children: widget.builtMenu.subCategories.map((subcategory) {
              return MenuSubCategoria(subCat: subcategory, indiceSelected: widget.indiceSelected);
            }).toList(),
          ),
      ],
    );
  }
}

class MenuSubCategoria extends StatelessWidget {
  final SubCategory subCat;
  final int indiceSelected;

  const MenuSubCategoria({super.key, required this.subCat, required this.indiceSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () async {
        await context.read<ItemsListProvider>().getItemsBySubCategory((subCat.subCategoryId).toString());
        context.read<ItemsListProvider>().selectedItem = indiceSelected;
      },
      child: Builder(
        builder: (context) {
          final isSelected = context.select((ItemsListProvider provider) => provider.selectedItem == indiceSelected);
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 35,
            alignment: Alignment.centerLeft,
            child: Text(
              subCat.description ?? '',
              style: TextStyle(
                fontSize: 12,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w400,
                color: isSelected ? Color.fromARGB(255, 41, 83, 181) : Color.fromARGB(255, 146, 159, 175),
              ),
            ),
          );
        },
      ),
    );
  }
}
/* 
class MenuMainCategoria extends StatelessWidget {
  final GroupsMain groupsItem;
  final int indiceSelected;

  const MenuMainCategoria(
      {super.key, required this.groupsItem, required this.indiceSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        context
            .read<ProductsListProvider>()
            .searchCategoryItems('id', (groupsItem.iD).toString());
        context.read<ProductsListProvider>().selectedItem = indiceSelected;
      },
      child: Builder(
        builder: (context) {
          final isSelected = context.select((ProductsListProvider provider) =>
              provider.selectedItem == indiceSelected);
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 35,
            decoration: BoxDecoration(
              color: isSelected ? GeneralTheme.bGRamoT : Colors.transparent,
              borderRadius: BorderRadius.circular(7),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              groupsItem.descriptionGi ?? '',
              style: const TextStyle(
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500),
            ),
          );
        },
      ),
    );
  }
}
 */