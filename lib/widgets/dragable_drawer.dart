import 'package:dragable_pers/providers/items_provider.dart';
import 'package:dragable_pers/widgets/manija.dart';
import 'package:dragable_pers/widgets/menu_categoria.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DraggableDrawer extends StatefulWidget {
  const DraggableDrawer({super.key});

  @override
  State<DraggableDrawer> createState() => _DraggableDrawerState();
}

class _DraggableDrawerState extends State<DraggableDrawer> {
  List<MenuMainCategoria> menuMainCategorias = [];

  @override
  void initState() {
    super.initState();
    addMainCategories();
  }

  void addMainCategories() {
    final listBuiltMenu = context.read<ItemsListProvider>().builtMenu;
    for (var i = 0; i < listBuiltMenu.length; i++) {
      menuMainCategorias.add(MenuMainCategoria(
        builtMenu: listBuiltMenu[i],
        indiceSelected: i,
      ));
    }
  }

  double drawerPosition = 0;
  bool isDrawerOpen = true;
  final double maxDrawerWidth = 250.0;

  void _handleDrag(DragUpdateDetails details) {
    setState(() {
      drawerPosition += details.delta.dx;
      drawerPosition = drawerPosition.clamp(0, maxDrawerWidth);
    });
  }

  void _handleDragEnd(DragEndDetails details) {
    final double velocity = details.primaryVelocity ?? 0;

    if (velocity > 0 || drawerPosition > maxDrawerWidth * 0.8) {
      _openDrawer();
    } else {
      _closeDrawer();
    }
  }

  void _openDrawer() {
    setState(() {
      drawerPosition = maxDrawerWidth - 30;
      isDrawerOpen = true;
    });
  }

  void _closeDrawer() {
    setState(() {
      drawerPosition = 0;
      isDrawerOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -(maxDrawerWidth - drawerPosition) + 30,
      top: 0,
      bottom: 0,
      width: maxDrawerWidth,
      child: GestureDetector(
        onHorizontalDragUpdate: _handleDrag,
        onHorizontalDragEnd: _handleDragEnd,
        child: Stack(
          children: [
            Positioned(
              right: 30,
              top: MediaQuery.of(context).size.height / 6,
              child: Container(
                height: 450,
                decoration: BoxDecoration(
                  gradient:const LinearGradient(
      stops: [0.2, 1],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color.fromARGB(255, 81, 7, 14),
        Color.fromARGB(255, 255, 23, 23),
      ],
    ),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(21),
                    bottomRight: Radius.circular(21),
                  ),
                ),
                width: maxDrawerWidth - 30,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [for (var i = 0; i < menuMainCategorias.length; i++) menuMainCategorias[i]],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: MediaQuery.of(context).size.height / 3,
              child: CustomPaint(
                painter: Manija(),
                child: const SizedBox(
                  width: 30,
                  height: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
