import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:color_palette/models/color_palette_model.dart';

//TODO: importar a color palette event e state

// TODO: criar classe para estado e para o evento
class PaletteBloc extends Bloc<ColorEvent, ColorState>{
  PaletteBloc() :super ("0xFFFFFF")


  @override
  Stream<List<String>> mapEventToState(ColorEvent event) {
    // TODO: implement mapEventToState
    // if (event is algumacoisa): ...
    throw UnimplementedError();
  }}

