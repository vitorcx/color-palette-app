import 'package:color_palette/bloc/color_field_bloc/color_field_bloc.dart';
import 'package:color_palette/views/color_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateColorPaletteScreen extends StatelessWidget {
  const CreateColorPaletteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: [
          BlocProvider(
            create: (context) => ColorFieldBloc('d834eb'),
            child: ColorField(),
          ),
          BlocProvider(
            create: (context) => ColorFieldBloc('3474eb'),
            child: ColorField(),
          ),
          BlocProvider(
            create: (context) => ColorFieldBloc('d834eb'),
            child: ColorField(),
          ),
          BlocProvider(
            create: (context) => ColorFieldBloc('3474eb'),
            child: ColorField(),
          ),
          BlocProvider(
            create: (context) => ColorFieldBloc('d834eb'),
            child: ColorField(),
          ),
        ],
      ),
    );
  }
}
