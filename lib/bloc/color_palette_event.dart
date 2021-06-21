import 'package:equatable/equatable.dart';

class ColorPaletteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ColorPaletteFetchList extends ColorPaletteEvent {}

class ColorPaletteDelete extends ColorPaletteEvent {}

class ColorPaletteEdit extends ColorPaletteEvent {}

class ColorPaletteCreate extends ColorPaletteEvent {}

class ColorPaletteFetchListWithError extends ColorPaletteEvent {}

class ColorPaletteFetchListWithEmptyList extends ColorPaletteEvent {}
