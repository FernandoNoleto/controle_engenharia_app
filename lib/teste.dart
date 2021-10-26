import 'package:flutter/material.dart';

class Bloco {
  int id;
  String name;
  String value;

  Bloco({this.id = 0, this.name = "", this.value = ""});

  static List<Bloco> getBlocos() {
    return blocos;
  }

  static addBlocos(id, firstName, lastName) {
    var bloco = new Bloco();
    bloco.id = id;
    bloco.name = firstName;
    bloco.value = lastName;
    blocos.add(bloco);
  }

}

List<Bloco> blocos = [];

class DataTableDemo extends StatefulWidget {
  DataTableDemo() : super();

  final String title = "Calculadora CP";


  @override
  DataTableDemoState createState() => DataTableDemoState();
}

class DataTableDemoState extends State<DataTableDemo> {
  late List<Bloco> blocos;
  late List<Bloco> selectedBlocos;
  late bool sort;


  @override
  void initState() {
    sort = false;
    selectedBlocos = [];
    blocos = Bloco.getBlocos();
    super.initState();
  }

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        blocos.sort((a, b) => a.name.compareTo(b.name));
      } else {
        blocos.sort((a, b) => b.name.compareTo(a.name));
      }
    }
  }

  onSelectedRow(bool selected, Bloco bloco) async {
    setState(() {
      if (selected) {
        selectedBlocos.add(bloco);
      } else {
        selectedBlocos.remove(bloco);
      }
    });
  }

  deleteSelected() async {
    setState(() {
      if (selectedBlocos.isNotEmpty) {
        List<Bloco> temp = [];
        temp.addAll(selectedBlocos);
        for (Bloco bloco in temp) {
          blocos.remove(bloco);
          selectedBlocos.remove(bloco);
        }
      }
    });
  }

  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          MaterialButton(
            child: Text('Adicionar bloco'),
            onPressed: () {
              var bloco = new Bloco();
              bloco.name = "bloco"+(blocos.length+1).toString();
              bloco.value = "default lastName";
              bloco.id = blocos.length+1;
              blocos.add(bloco);
              setState(() {});
            },
          ),
          MaterialButton(
            child: Text('Imprimir todas as linhas'),
            onPressed: () {
              blocos.forEach((u) => print("${u.name} ${u.value}"));
            },
          ),
          DataTable(
            sortAscending: sort,
            sortColumnIndex: 0,
            columns: [
              DataColumn(
                  label: Text("#"),
                  numeric: false,
                  tooltip: "Bloco",
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      sort = !sort;
                    });
                    onSortColum(columnIndex, ascending);
                  }),
              DataColumn(
                label: Text("Valor"),
                numeric: false,
                tooltip: "Valor",
              ),
            ],
            rows: blocos
                .map(
                  (bloco) => DataRow(
                      selected: selectedBlocos.contains(bloco),
                      onSelectChanged: (b) {
                        print("Onselect");
                        onSelectedRow(b!, bloco);
                      },
                      cells: [
                        DataCell(
                          Text("Bloco #"+bloco.id.toString()),
                        ),
                        DataCell(
                          //Text(user.firstName),
                          TextField(
                            onChanged: (text) {
                              print("First text field: $text");
                              bloco.name = text;
                            },
                          ),
                        ),
                      ]),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(
            child: dataBody(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: OutlineButton(
                  child: Text('#${selectedBlocos.length}'),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: OutlineButton(
                  child: Text('Remover selecionados'),
                  onPressed: selectedBlocos.isEmpty
                      ? null
                      : () {
                          deleteSelected();
                        },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: OutlineButton(
                  child: Text('Ok'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
