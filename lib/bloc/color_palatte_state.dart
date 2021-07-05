import 'package:color_palette/models/color_palette_model.dart';
import 'package:equatable/equatable.dart';

abstract class ColorPaletteState extends Equatable {
  @override
  List<Object> get props => [];
}

class ColorPaletteLoading extends ColorPaletteState {}

class ColorPaletteErrorState extends ColorPaletteState {
  final String message;
  ColorPaletteErrorState({required this.message});
}

class ColorPaletteLoaded extends ColorPaletteState {
  final List<ColorPalette> list;

  ColorPaletteLoaded({required this.list});
}

class ColorPaletteAdded extends ColorPaletteState {}

class ColorPaletteEdited extends ColorPaletteState {}

class ColorPaletteEmptyList extends ColorPaletteState {}
