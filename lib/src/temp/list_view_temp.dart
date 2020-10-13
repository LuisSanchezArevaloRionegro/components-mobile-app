import 'package:flutter/material.dart';

class ListViewTemp extends StatelessWidget {
  final options = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components temp'),
      ),
      // body: ListView(children: _createItems()),
      body: ListView(children: _createItemsShort()),
    );
  }

  List<Widget> _createItems() {
    List<Widget> list = new List<Widget>();

    for (var option in options) {
      final listTile = ListTile(
        title: Text(option.toString()),
      );

      list
        ..add(listTile)
        ..add(Divider(
          thickness: 1.0,
        ));

      //..add hace puedas hacer una serie de llamadas al metodo sin nedesidad de hacer referencia al objeto, hace lo mismo que lo siguiente
      // list.add(Divider(
      //   height: 5.0,
      // ));
    }

    return list;
  }

  List<Widget> _createItemsShort() {
    return options.map((option) {
      return Column(
        children: [
          ListTile(
            title: Text(option.toString()),
            subtitle: Text('Cualquier cosa'),
            leading: Icon(Icons.zoom_out_map),
            trailing: Icon(Icons.keyboard_arrow_right),
            onLongPress: () {
              print('Presionando por largo periodo de tiempo');
            },
            onTap: () {
              print('Toque');
            },
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
