import 'package:color_palette/bloc/color_field_bloc/colors_form_bloc.dart';
import 'package:color_palette/bloc/color_field_bloc/colors_form_state.dart';
import 'package:color_palette/views/color_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateColorPaletteScreen extends StatelessWidget {
  const CreateColorPaletteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<int> colorsFromNavigator = [
      83947283,
      92377722,
      88366633,
      91011123,
      12345678
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Paleta de Cores'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
          )
        ],
      ),
      body: BlocProvider<ColorsFormBloc>(
        create: (context) =>
            ColorsFormBloc(ColorsFormState(colorsFromNavigator)),
        child: ListView(
          children: [
            for (int i = 0; i < colorsFromNavigator.length; i++)
              ColorField(index: i),
          ],
        ),
      ),
    );
  }
}
