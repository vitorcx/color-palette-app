import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListColorPalettes extends StatelessWidget {
  const ListColorPalettes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Suas paletas de cores',
            textDirection: TextDirection.ltr,
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[200],
        ),
        // body: BlocBuilder(
        //   bloc: palletbloc,
        //   builder: (context, snapshot) {
        //             return palletbloc.lista?? Container(child: Text("Você ainda não tem uma paleta de cores :( \n
        //  experimente cirar uma agora mesmo!", ),)}),

        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: Colors.green[700],
          //Coloquei cores aqui mas não sei se vai ter mesmo
        ));
  }
}
