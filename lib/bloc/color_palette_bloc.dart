import 'package:color_palette/bloc/color_palatte_state.dart';
import 'package:color_palette/bloc/color_palette_event.dart';
import 'package:color_palette/data/color_palette_firebase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:color_palette/models/color_palette_model.dart';

class ColorPaletteBloc extends Bloc<ColorPaletteEvent, ColorPaletteState> {
  ColorPaletteBloc(ColorPaletteState initialState)
      : super(ColorPaletteLoading());

  ColorPaletteFirebase colorPaletteFirebase = ColorPaletteFirebase();

  @override
  Stream<ColorPaletteState> mapEventToState(ColorPaletteEvent event) async* {
    // TODO: implement mapEventToState

    switch (event.runtimeType) {
      case ColorPaletteFetchList:
        //yield ColorPaletteLoading();
        List<ColorPalette> colorPaletteList =
            await colorPaletteFirebase.getColorPalettes();
        yield ColorPaletteLoaded(list: colorPaletteList);
        break;
      case ColorPaletteDelete:
        break;
      case ColorPaletteEdit:
        break;
      case ColorPaletteCreate:
        break;
      case ColorPaletteFetchListWithEmptyList:
        break;
      case ColorPaletteFetchListWithError:
        break;
      default:
        throw UnimplementedError();
    }
  }
}
