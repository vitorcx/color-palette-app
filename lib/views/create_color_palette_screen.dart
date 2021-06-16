import 'package:flutter/material.dart';

class CreateColorPaletteScreen extends StatelessWidget {
  const CreateColorPaletteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Paleta de Cores'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
          )
        ],
      ),
      body: ListView(
        children: [
          _buildColorField('d834eb'),
          _buildColorField('3474eb'),
          _buildColorField('d834eb'),
          _buildColorField('3474eb'),
          _buildColorField('d834eb'),
        ],
      ),
    );
  }

  Widget _buildColorField(String color) {
    TextEditingController _controller = TextEditingController(text: color);
    return Stack(
      children: [
        ListTile(
          tileColor: Color(int.parse('0xff${_controller.text}')),
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
  }
} //TODO: bolar jeito de onChande alterar a cor do campo em tempo real
//TODO: bolar jeito de re-gerar todos os campos
