import 'package:flutter/material.dart';

class CorposDeProva2Screen extends StatelessWidget {
  final String numeroCorposdeProva;

  const CorposDeProva2Screen({Key? key, required this.numeroCorposdeProva})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Corpos de prova"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          DataTable(columns: [
            DataColumn(label: Text("Corpo de Prova")),
            DataColumn(label: Text("Valor"), numeric: true),
          ], rows: [
            DataRow(cells: [
              DataCell(Text("Corpo de prova 1")),
              DataCell(
                  TextFormField(
                    decoration: InputDecoration(hintText: "Preencha os valores"),
                    onFieldSubmitted: (val) {
                      print('onSubmited $val');
                    },
                  ),
                  showEditIcon: true),
            ]),
          ]),
          // Text(
          //   numeroCorposdeProva,
          //   style: TextStyle(fontSize: 24),
          // ),
        ],
      ),
    );
  }
}
