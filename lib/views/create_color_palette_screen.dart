import 'package:color_palette/bloc/color_field_bloc/colors_form_bloc.dart';
import 'package:color_palette/bloc/color_palette_bloc.dart';
import 'package:color_palette/bloc/color_palette_event.dart';
import 'package:color_palette/models/color_palette_model.dart';
import 'package:color_palette/views/color_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateColorPaletteScreen extends StatefulWidget {
  @override
  _CreateColorPaletteScreenState createState() =>
      _CreateColorPaletteScreenState();
}

class _CreateColorPaletteScreenState extends State<CreateColorPaletteScreen> {
  final TextEditingController _controller =
      TextEditingController(text: 'Nova Paleta');

  @override
  Widget build(BuildContext context) {
    print(_controller.text);
    return Scaffold(
      appBar: AppBar(title: Text('Nova Paleta de Cores'), centerTitle: true),
      body: Column(mainAxisSize: MainAxisSize.max, children: [
        Center(
          child: Column(
            children: [
              TextField(
                textAlign: TextAlign.center,
                controller: _controller,
              ),
              Column(
                children: [
                  for (int i = 0; i < 5; i++) ColorField(index: i),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {},
          color: Colors.black,
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {
              List<int> colors =
                  BlocProvider.of<ColorsFormBloc>(context).state.colors;
              final newColorPalette =
                  ColorPalette(id: '', colors: colors, title: _controller.text);
              BlocProvider.of<ColorPaletteBloc>(context)
                  .add(ColorPaletteCreate(newColorPalette));
              Navigator.of(context).pop();
            },
            child: Text("SALVAR"),
            style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(color: Colors.black))),
          ),
        )
      ]),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
//vou reiniciar
