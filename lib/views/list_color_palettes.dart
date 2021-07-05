import 'package:color_palette/bloc/color_field_bloc/colors_form_bloc.dart';
import 'package:color_palette/bloc/color_field_bloc/colors_form_state.dart';
import 'package:color_palette/bloc/color_palatte_state.dart';
import 'package:color_palette/bloc/color_palette_bloc.dart';
import 'package:color_palette/bloc/color_palette_event.dart';
import 'package:color_palette/views/create_color_palette_screen.dart';
import 'package:color_palette/views/empty_color_pallette_screen.dart';
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
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 10,
          backgroundColor: Colors.grey,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: BlocProvider.of<ColorPaletteBloc>(context),
                    ),
                    BlocProvider<ColorsFormBloc>(
                      create: (_) => ColorsFormBloc(
                          //id nulo pois é caso de criação de nova paleta
                          ColorsFormState(id: '', colors: initialColors)),
                    )
                  ],
                  child: CreateColorPaletteScreen(editing: false),
                );
              },
            ));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.grey[700],
        ),
        backgroundColor: Colors.grey,
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
                  return ListTile(
                    title: Text(
                      "${state.list[index].title}",
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    tileColor: Colors.white,
                    onTap: () {
                      //id nao nulo pois é caso de edição de paleta existente
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) {
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider.value(
                                value:
                                    BlocProvider.of<ColorPaletteBloc>(context),
                              ),
                              BlocProvider<ColorsFormBloc>(create: (_) {
                                List<int> paletteColorsList =
                                    state.list[index].colors;
                                String title = state.list[index].title;
                                late String id = state.list[index].id;
                                return ColorsFormBloc(ColorsFormState(
                                    colors: paletteColorsList,
                                    title: title,
                                    id: id));
                              })
                            ],
                            child: CreateColorPaletteScreen(editing: true),
                          );
                        },
                      ));
                    },
                    contentPadding: EdgeInsets.all(10),
                    subtitle: Container(
                      child:
                          Row(children: colorCircles(state.list[index].colors)),
                    ),
                  );
                });
          } else if (state is ColorPaletteAdded ||
              state is ColorPaletteEdited) {
            bloc.add(ColorPaletteFetchList());
            return Center(child: CircularProgressIndicator());
          } else if (state is ColorPaletteEmptyList) {
            return EmptyListPage();
          } else if (state is ColorPaletteErrorState) {
            return Text('${state.message}');
          } else {
            print('Estado não implementado');
            return Container();
          }
        }));
  }
}

List<Widget> colorCircles(List<int> colorsList) {
  List<Widget> list = [];
  for (int i = 0; i < 5; i++) {
    Widget circle = Padding(
      padding: EdgeInsets.all(5),
      child: CircleAvatar(
        backgroundColor: Color(colorsList[i]).withAlpha(0xff),
        radius: 10,
      ),
    );
    list.add(circle);
  }
  return list;
}
