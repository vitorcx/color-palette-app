import 'package:color_palette/bloc/color_field_bloc/colors_form_bloc.dart';
import 'package:color_palette/bloc/color_field_bloc/colors_form_event.dart';
import 'package:color_palette/bloc/color_field_bloc/colors_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:math';

Random random = new Random();

String generateRandomHexColor() {
  int length = 4;
  String chars = '0123456789ABCDEF';
  String hex = '0xFF';
  while (length-- > 0) hex += chars[(random.nextInt(16)) | 0];
  return hex;
}

class ColorField extends StatelessWidget {
  final int index;
  const ColorField({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorsFormBloc, ColorsFormState>(
      builder: (context, state) {
        print(state.colors);
        int color = Random().nextInt(0xffffffff);
        print(color); //todo: trocar cores de hex string pra int no app/firebase
        return Container(
            padding: EdgeInsets.all(10),
            color: Color(color).withAlpha(0xff),
            child: Row(
              children: [
                Text(state.colors[index]),
                IconButton(
                    onPressed: () {
                      String randomHexColor = generateRandomHexColor();
                      BlocProvider.of<ColorsFormBloc>(context).add(
                          ChangeColorEvent(
                              colors: state.colors,
                              index: index,
                              newColor: randomHexColor));
                    },
                    icon: Icon(Icons.refresh))
              ],
            ));
      },
    );
  }
}
