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
    switch (event.runtimeType) {
      case ColorPaletteFetchList:
        //yield ColorPaletteLoading();
        List<ColorPalette> colorPaletteList =
            await colorPaletteFirebase.getColorPalettes();
        if (colorPaletteList.isEmpty) {
          yield ColorPaletteEmptyList();
        } else {
          yield ColorPaletteLoaded(list: colorPaletteList);
        }
        break;
      case ColorPaletteDelete:
        break;
      case ColorPaletteEdit:
        event as ColorPaletteEdit;
        try {
          await colorPaletteFirebase.editColorPalette(
              event.colorPalette.id, event.colorPalette.toJson());
          yield ColorPaletteEdited();
        } catch (e) {
          yield ColorPaletteErrorState(
              message: 'Erro ao editar dados do Firebase.');
        }
        break;
      case ColorPaletteCreate:
        event as ColorPaletteCreate;
        try {
          final newColorPalette = event.newColorPalette.toJson();
          await colorPaletteFirebase.addColorPalette(newColorPalette);
          yield ColorPaletteAdded();
        } catch (e) {
          yield ColorPaletteErrorState(
              message: 'Erro ao salvar dados no Firebase.');
        }
        break;
      case ColorPaletteFetchListWithEmptyList:
        yield ColorPaletteEmptyList();
        break;
      case ColorPaletteFetchListWithError:
        break;
      default:
        throw UnimplementedError();
    }
  }
}
