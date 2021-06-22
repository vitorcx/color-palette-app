import 'package:color_palette/bloc/color_palatte_state.dart';
import 'package:color_palette/bloc/color_palette_bloc.dart';
import 'package:color_palette/data/color_palette_firebase.dart';
import 'package:color_palette/models/color_palette_model.dart';
import 'package:color_palette/views/create_color_palette_screen.dart';
import 'package:color_palette/views/list_color_palettes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(ColorPaletteApp());
}

class ColorPaletteApp extends StatefulWidget {
  const ColorPaletteApp({Key? key}) : super(key: key);

  @override
  _ColorPaletteAppState createState() => _ColorPaletteAppState();
}

class _ColorPaletteAppState extends State<ColorPaletteApp> {
  ColorPalette colorPalette = ColorPalette(
      id: 'test', title: 'Paleta legal 1', colors: ['aaa', 'bbb', 'ccc']);
  final Future<FirebaseApp> _intialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.black),
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: _intialization,
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Center(child: Text("Erro ao conectar com o Firebase."));
            if (snapshot.connectionState == ConnectionState.done) {
              return BlocProvider<ColorPaletteBloc>(
                  create: (context) => ColorPaletteBloc(ColorPaletteLoading()),
                  child: ListColorPalettes());
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
