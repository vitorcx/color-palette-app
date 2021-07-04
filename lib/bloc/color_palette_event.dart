import 'package:color_palette/models/color_palette_model.dart';
import 'package:equatable/equatable.dart';

class ColorPaletteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ColorPaletteFetchList extends ColorPaletteEvent {}

class ColorPaletteDelete extends ColorPaletteEvent {}

class ColorPaletteEdit extends ColorPaletteEvent {
  final ColorPalette colorPalette;

  ColorPaletteEdit(this.colorPalette);
}

class ColorPaletteCreate extends ColorPaletteEvent {
  final ColorPalette newColorPalette;

  ColorPaletteCreate(this.newColorPalette);
}

class ColorPaletteFetchListWithError extends ColorPaletteEvent {}

class ColorPaletteFetchListWithEmptyList extends ColorPaletteEvent {}
