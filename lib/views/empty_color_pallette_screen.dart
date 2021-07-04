import 'package:flutter/material.dart';
import 'package:color_palette/views/create_color_palette_screen.dart';

class EmptyListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sua lista de Palletas",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(200, 50, 200, 200)),
          Text(
            "Não foi possível Encontrar listas :(",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          Padding(padding: EdgeInsets.all(100)),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CreateColorPaletteScreen(editing: false)),
              );
            },
            child: Text("Criar novas pallteas"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
