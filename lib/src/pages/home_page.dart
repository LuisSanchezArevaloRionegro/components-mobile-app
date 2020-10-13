import 'package:flutter/material.dart';

import 'package:components_mobile_app/src/providers/menu_provider.dart';
import 'package:components_mobile_app/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: providerMenu.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _createItemsList(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _createItemsList(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    data.forEach((option) {
      final widgetTemp = ListTile(
        title: Text(option['texto']),
        leading: getIcon(option['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue,
        ),
        onTap: () {
          // final route = MaterialPageRoute(builder: (context) => AlertPage());
          // Navigator.push(context, route);

          Navigator.pushNamed(context, option['ruta']);
        },
      );
      options..add(widgetTemp)..add(Divider());
    });

    return options;
  }
}
