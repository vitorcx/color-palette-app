import 'package:color_palette/bloc/color_field_bloc/color_field_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorFieldBloc extends Bloc<ColorFieldEvent, String> {
  ColorFieldBloc(String initialState) : super(initialState);

  @override
  Stream<String> mapEventToState(ColorFieldEvent event) async* {
    if (event is ColorChanged) {
      yield event.color;
    } else {
      throw Exception('Event not found');
    }
  }
}
