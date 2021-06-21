import 'package:color_palette/bloc/color_palatte_state.dart';
import 'package:color_palette/bloc/color_palette_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:color_palette/models/color_palette_model.dart';

class ColorPaletteBloc extends Bloc<ColorPaletteEvent, ColorPaletteState> {
  ColorPaletteBloc(ColorPaletteState initialState)
      : super(ColorPaletteLoading());

  @override
  Stream<ColorPaletteState> mapEventToState(ColorPaletteEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
