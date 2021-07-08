import 'package:color_palette/bloc/color_field_bloc/colors_form_bloc.dart';
import 'package:color_palette/bloc/color_field_bloc/colors_form_event.dart';
import 'package:color_palette/bloc/color_field_bloc/colors_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorField extends StatelessWidget {
  final int index;
  const ColorField({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorsFormBloc, ColorsFormState>(
      builder: (context, state) {
        Color color = Color(state.colors[index]).withAlpha(0xff);
        Color textColor =
            color.computeLuminance() < 0.2 ? Colors.white : Colors.black;
        return Container(
            padding: EdgeInsets.all(10),
            color: color,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'R: ${color.red}   G: ${color.green}   B: ${color.blue}',
                  style: TextStyle(color: textColor, fontSize: 18),
                ),
                IconButton(
                    color: textColor,
                    onPressed: () {
                      BlocProvider.of<ColorsFormBloc>(context).add(
                          ChangeColorsFormEvent(
                              colors: state.colors,
                              index: index,
                              title: state.title,
                              id: state.id));
                    },
                    icon: Icon(Icons.refresh))
              ],
            ));
      },
    );
  }
}
