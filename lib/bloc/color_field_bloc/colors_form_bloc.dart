import 'package:color_palette/bloc/color_field_bloc/colors_form_event.dart';
import 'package:color_palette/bloc/color_field_bloc/colors_form_state.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorsFormBloc extends Bloc<ColorsFormEvent, ColorsFormState> {
  ColorsFormBloc(ColorsFormState initialState) : super(initialState);

  @override
  Stream<ColorsFormState> mapEventToState(ColorsFormEvent event) async* {
    if (event is ChangeColorEvent) {
      ColorsFormState state = ColorsFormState(event.colors);
      state.colors[event.index] = event.newColor;
      yield state;
    } else {
      throw Exception('Event not found');
    }
  }
}
