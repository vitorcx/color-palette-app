import 'package:color_palette/bloc/color_field_bloc/colors_form_bloc.dart';
import 'package:color_palette/bloc/color_palette_bloc.dart';
import 'package:color_palette/bloc/color_palette_event.dart';
import 'package:color_palette/models/color_palette_model.dart';
import 'package:color_palette/views/color_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:color_palette/bloc/color_field_bloc/colors_form_state.dart';
import 'package:color_palette/bloc/color_palatte_state.dart';
import 'package:color_palette/views/create_color_palette_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmpytListPage extends StatelessWidget {
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
                    builder: (context) => CreateColorPaletteScreen()),
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
