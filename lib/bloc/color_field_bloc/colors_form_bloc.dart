import 'package:color_palette/bloc/color_field_bloc/colors_form_event.dart';
import 'package:color_palette/bloc/color_field_bloc/colors_form_state.dart';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorsFormBloc extends Bloc<ColorsFormEvent, ColorsFormState> {
  ColorsFormBloc(ColorsFormState initialState) : super(initialState);

  @override
  Stream<ColorsFormState> mapEventToState(ColorsFormEvent event) async* {
    if (event is ChangeColorsFormEvent) {
      ColorsFormState state = ColorsFormState(
          id: event.id, colors: event.colors, title: event.title);
      int newColor = Random().nextInt(0xffffffff);
      if (event.index >= 0) //index > 0 => válido
        state.colors[event.index] = newColor;
      yield state;
    } else {
      throw Exception('Event not found');
    }
  }
}
