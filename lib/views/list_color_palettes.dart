import 'package:color_palette/bloc/color_palatte_state.dart';
import 'package:color_palette/bloc/color_palette_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListColorPalettes extends StatelessWidget {
  const ListColorPalettes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Suas paletas de cores',
            textDirection: TextDirection.ltr,
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[200],
        ),
        body: BlocProvider<ColorPaletteBloc>(
          create: (BuildContext context) => ColorPaletteBloc(ColorPaletteLoading())
          ,child: BlocBuilder(bloc: ,),),
          //TODO: FAZER A LISTA DE PALETTES OU O BUILDER AQUI
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: Colors.green[700],
          //Coloquei cores aqui mas não sei se vai ter mesmo
        ));
  }
}
