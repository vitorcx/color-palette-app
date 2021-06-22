import 'package:color_palette/bloc/color_field_bloc/colors_form_bloc.dart';
import 'package:color_palette/bloc/color_field_bloc/colors_form_event.dart';
import 'package:color_palette/bloc/color_field_bloc/colors_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:math';

class ColorField extends StatelessWidget {
  final int index;
  const ColorField({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorsFormBloc, ColorsFormState>(
      builder: (context, state) {
        return Container(
            padding: EdgeInsets.all(10),
            color: Color(state.colors[index]).withAlpha(0xff),
            child: Row(
              children: [
                Text('${state.colors[index]}'),
                IconButton(
                    onPressed: () {
                      int newColor = Random().nextInt(0xffffffff);
                      BlocProvider.of<ColorsFormBloc>(context).add(
                          ChangeColorEvent(
                              colors: state.colors,
                              index: index,
                              newColor: newColor));
                    },
                    icon: Icon(Icons.refresh))
              ],
            ));
      },
    );
  }
}
