import 'package:color_palette/bloc/color_field_bloc/colors_form_bloc.dart';
import 'package:color_palette/bloc/color_field_bloc/colors_form_state.dart';
import 'package:color_palette/bloc/color_palatte_state.dart';
import 'package:color_palette/bloc/color_palette_bloc.dart';
import 'package:color_palette/bloc/color_palette_event.dart';
import 'package:color_palette/views/create_color_palette_screen.dart';
import 'package:color_palette/views/empyt_color_pallette_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListColorPalettes extends StatelessWidget {
  const ListColorPalettes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> initialColors = [
      83947283,
      92377722,
      88366633,
      91011123,
      12345678
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Suas Paletas de Cores',
          ),
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //prover colorsForm (primeira vez) e colorpalette.value
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: BlocProvider.of<ColorPaletteBloc>(context),
                    ),
                    BlocProvider<ColorsFormBloc>(
                      create: (_) =>
                          ColorsFormBloc(ColorsFormState(initialColors)),
                    )
                  ],
                  child: CreateColorPaletteScreen(),
                );
              },
            ));
          },
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
          } else if (state is ColorPaletteLoaded) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text("${state.list[index].title}"),
                trailing: Icon(Icons.mode_edit_outline_outlined),
                // onTap: Navigator.of(context).push(MaterialPageRoute(),
                 
            );
          });}
            else if (state is ColorPaletteAdded) {
            bloc.add(ColorPaletteFetchList());
            return Center(child: CircularProgressIndicator());
          } else if (state is ColorPaletteEmptyList) {
            return EmpytListPage();
          } else {
            print('Estado não implementado');
            return Container();
          }
        
  }));}
