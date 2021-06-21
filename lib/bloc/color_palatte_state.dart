import 'package:equatable/equatable.dart';

class ColorPaletteState extends Equatable {
  @override
  List<Object> get props => [];
}

class ColorPaletteLoading extends ColorPaletteState {}

class ColorPaletteErrorState extends ColorPaletteState {
  final String message;
  ColorPaletteErrorState({required this.message});
}

class ColorPaletteLoaded extends ColorPaletteState {
  final List<Object> list;
  ColorPaletteLoaded({required this.list});
}

class ColorPaletteEmptyList extends ColorPaletteState {}
