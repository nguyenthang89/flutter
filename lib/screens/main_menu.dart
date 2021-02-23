import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduce_to_widgets/models/infra/menu_item.dart';
import 'package:introduce_to_widgets/screens/Dashboard.dart';
import 'package:introduce_to_widgets/screens/Cat.dart';

class MainMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainMenuState();
  }
}

class MainMenuState extends State<MainMenu> {
  MenuItem _selectedMenuItem;
  List<MenuItem> _menuItems;
  List<Widget> _menuOptionWidgets = [];

  @override
  Widget build(BuildContext context) {
    _menuOptionWidgets = [];

    for (var menuItem in _menuItems) {
      _menuOptionWidgets.add(new ListTile(
        leading: new Image.asset(menuItem.icon),
        onTap: () => _onSelectItem(menuItem),
        title: Text(
          menuItem.title,
          style: new TextStyle(
              fontSize: 20,
              color: menuItem.color,
              fontWeight: menuItem == _selectedMenuItem
                  ? FontWeight.bold
                  : FontWeight.w300),
        ),
      ));
    }

    return Container(
      child: new Column(children: _menuOptionWidgets),
    );
  }

  @override
  void initState() {
    super.initState();

    _menuItems = createMenuItems();
  }

  _onSelectItem(MenuItem menuItem) {
    setState(() {
      _selectedMenuItem = menuItem;
    });
    Navigator.of(context).pop(); // close side menu
  }

  List<MenuItem> createMenuItems() {
    final menuItems = [
      new MenuItem("Dashboard", 'assets/images/dashboard.png', Colors.black,
          () => new Dashboard()),
      new MenuItem(
          "Cat", 'assets/images/cat.png', Colors.black, () => new Cat()),
    ];

    return menuItems;
  }
}
