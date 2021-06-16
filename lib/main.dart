import 'package:color_palette/data/color_palette_firebase.dart';
import 'package:color_palette/models/color_palette_model.dart';
import 'package:color_palette/views/create_color_palette_screen.dart';
import 'package:color_palette/views/list_color_palettes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(ColorPaletteApp());
}

class ColorPaletteApp extends StatefulWidget {
  const ColorPaletteApp({Key? key}) : super(key: key);

  @override
  _ColorPaletteAppState createState() => _ColorPaletteAppState();
}

class _ColorPaletteAppState extends State<ColorPaletteApp> {
  final Future<FirebaseApp> _intialization = Firebase.initializeApp();
  ColorPalette colorPalette = ColorPalette(
      id: 'test', title: 'Paleta legal 1', colors: ['aaa', 'bbb', 'ccc']);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.black),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Suas Paletas de Cores',
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: FutureBuilder(
            future: _intialization,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("Erro ao conectar com o Firebase."));
              }
              if (snapshot.connectionState == ConnectionState.done) {
                ColorPaletteFirebase cp = ColorPaletteFirebase();
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    CreateColorPaletteScreen(),
                    Positioned(
                      top: MediaQuery.of(context).size.height - 170,
                      left: MediaQuery.of(context).size.width - 100,
                      child: FloatingActionButton(
                          child: Icon(Icons.add),
                          onPressed: () {
                            cp.addColorPalette(colorPalette.toJson());
                          }),
                    ),
                  ],
                );
              }
              return Center(
                  child: CircularProgressIndicator(color: Colors.black));
            },
          ),
        ));
  }
}
