import 'package:color_palette/bloc/color_palatte_state.dart';
import 'package:color_palette/bloc/color_palette_bloc.dart';
import 'package:color_palette/bloc/color_palette_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_listview/infinite_listview.dart';

class ListColorPalettes extends StatelessWidget {
  const ListColorPalettes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Suas Paletas de Cores',
          ),
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: Colors.green[700],
          //Coloquei cores aqui mas não sei se vai ter mesmo
        ),
        body: BlocBuilder<ColorPaletteBloc, ColorPaletteState>(
            builder: (context, state) {
          ColorPaletteBloc bloc = BlocProvider.of<ColorPaletteBloc>(context);
          bloc.add(ColorPaletteFetchList());
          if (state is ColorPaletteLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            state as ColorPaletteLoaded;
            return ListView.builder(
              itemBuilder: (context, item) {
                return ListTile(title: Text("teste ${state.list[item].title}"));
              },
              itemCount: state.list.length,
            );
          }
        }));
  }
}
