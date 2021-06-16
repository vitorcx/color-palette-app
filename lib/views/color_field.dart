import 'package:flutter/material.dart';

class ColorField extends StatelessWidget {
  final String color;

  ColorField({Key? key, required this.color}) : super(key: key);
  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = TextEditingController(text: color);
    return BlocBuilder<ColorFieldBloc, ColorFieldBlocState>(
      builder: (context, state) {
        return Stack(
          children: [
            ListTile(
              tileColor: Color(int.parse('0xff${state.color}')),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  border: InputBorder.none,
                  filled: true),
            )
          ],
        );
      },
    );
  }
} //todo: on change disparar um evento q muda o state q é a cor, então rebuildar o listtile apenas
