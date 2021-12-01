import 'package:flutter/material.dart';
import 'package:controle_engenharia/corposdeprovascreen2.dart';
import 'package:controle_engenharia/Objects/blocos.dart';


List<Bloco> blocos = [];

class corposDeProvaScreen extends StatefulWidget {
  corposDeProvaScreen() : super();

  final String title = "Calculadora CP";

  @override
  corposDeProvaScreenState createState() => corposDeProvaScreenState();
}

class corposDeProvaScreenState extends State<corposDeProvaScreen> {
  late List<Bloco> blocos = [];
  late List<Bloco> selectedBlocos;
  late bool sort;

  SnackBar twoFieldsMessage = SnackBar(
    content: const Text("Para continuar preencha pelo menos 2 campos!"),
    action: SnackBarAction(
      label: "Ok",
      onPressed: () {},
    ),
  );

  SnackBar blankFieldMessage = SnackBar(
    content: const Text("Algum campo está vazio!"),
    action: SnackBarAction(
      label: "Ok",
      onPressed: () {},
    ),
  );


  @override
  void initState() {
    sort = false;
    selectedBlocos = [];
    blocos = Bloco.getBlocos();
    // blocos = [];
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
          print(bloco.value);
          blocos.remove(bloco);
          selectedBlocos.remove(bloco);
        }
      }
    });
    updateId();
  }

  updateId() async {
    setState(() {
      int i = 1;
      for (Bloco bloco in blocos) {
        bloco.id = i;
        i++;
      }
    });
  }

  bool isValide() {
    if (blocos.length <= 1){
      ScaffoldMessenger.of(context).showSnackBar(twoFieldsMessage);
      return false;
    }
    for (Bloco bloco in blocos) {
      print("id: ${bloco.id}, name: ${bloco.name}, value: ${bloco.value}");
      if (bloco.value == "") {
        print(bloco.value);
        // blocos.remove(bloco);
        ScaffoldMessenger.of(context).showSnackBar(blankFieldMessage);
        return false;
      }
    }
    return true;
  }

  calculate() {
    isValide()
        ? setState(() {
            try {
              for (Bloco bloco in blocos) {
                print(bloco.value);
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          corposDeProvaScreen2(blocos: blocos)));
            } catch (exception) {
              print(exception);
            }
          })
        : print("");
  }

  debug(){
    for(Bloco bloco in blocos){
      print("blocos: id: ${bloco.id}, name: ${bloco.name}, value: ${bloco.value}");
    }
    for (Bloco bloco in selectedBlocos) {
      print("selected blocos: id: ${bloco.id}, name: ${bloco.name}, value: ${bloco.value}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey,
      ),

      //-----------------------------------------------------------------------------------

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 15.0, bottom: 5.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Colors.redAccent,
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    child:
                        Text('Remover (${selectedBlocos.length}) selecionados'),
                    onPressed: selectedBlocos.isEmpty
                        ? null
                        : () {
                            deleteSelected();
                          },
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.all(10.0),
                //   child: OutlinedButton(
                //     style: OutlinedButton.styleFrom(
                //       primary: Colors.greenAccent,
                //       shape: StadiumBorder(),
                //       textStyle: TextStyle(
                //         fontSize: 18,
                //       ),
                //     ),
                //     child: Text('Imprimir'),
                //     onPressed: (){ debug();},
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 15.0, bottom: 5.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.greenAccent,
                      shape: StadiumBorder(),
                      textStyle: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    child: Text('OK'),
                    onPressed: blocos.isEmpty
                        ? null
                        : () {
                            calculate();
                          },
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                DataTable(
                  horizontalMargin: 40.0,
                  sortAscending: sort,
                  sortColumnIndex: 0,
                  columns: [
                    DataColumn(
                      label: Text("Bloco #"),
                      numeric: false,
                      tooltip: "Bloco",
                    ),
                    DataColumn(
                      label: Text("Valor do bloco"),
                      numeric: true,
                      tooltip: "Valor",
                    ),
                  ],
                  rows: blocos
                      .map(
                        (bloco) => DataRow(
                            selected: selectedBlocos.contains(bloco),
                            onSelectChanged: (b) {
                              print("Onselect: ${bloco.value}");
                              onSelectedRow(b!, bloco);
                            },
                            cells: [
                              DataCell(
                                Text("Bloco #" + bloco.id.toString()),
                              ),
                              DataCell(
                                //Text(user.firstName),
                                TextFormField(
                                  key: Key(bloco.value),
                                  initialValue: bloco.value,
                                  autofocus: false,
                                  expands: true,
                                  minLines: null,
                                  maxLines: null,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    print("text field: $value");
                                    bloco.value = value;
                                  },
                                ),
                              ),
                            ]),
                      )
                      .toList(),
                ),
              ],
            ),
          ],
        ),
      ),

      //-----------------------------------------------------------------------------------

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            var bloco = new Bloco();
            bloco.name = "bloco" + (blocos.length + 1).toString();
            bloco.value = "";
            bloco.id = blocos.length + 1;
            blocos.add(bloco);
          });
        },
        // child: const Icon(Icons.add),
        label: const Text("Adicionar"),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
