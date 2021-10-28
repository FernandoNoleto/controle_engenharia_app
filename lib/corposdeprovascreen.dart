import 'package:flutter/material.dart';
import 'package:controle_engenharia/corposdeprovascreen2.dart';
import 'package:controle_engenharia/Objects/blocos.dart';

class corposDeProvaScreen extends StatefulWidget {
  corposDeProvaScreen() : super();

  final String title = "Calculadora CP";

  @override
  corposDeProvaScreenState createState() => corposDeProvaScreenState();
}

class corposDeProvaScreenState extends State<corposDeProvaScreen> {
  // late List<Bloco> blocos;
  late List<Bloco> selectedBlocos;
  late bool sort;

  SnackBar warningMessage = SnackBar(content: const Text("Algum campo está vazio!"), action: SnackBarAction(label: "Ok", onPressed: (){},),);

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

  bool isValide(){

    for (Bloco bloco in blocos){
      if (bloco.value == ""){
        print(bloco.value);
        // blocos.remove(bloco);
        return false;
      }
    }
    return true;
  }

  calculate() {

    isValide() ?
      setState(() {
        try{
          for(Bloco bloco in blocos){
            print(bloco.value);
          }
          Navigator.push(context, MaterialPageRoute(builder: (context) => corposDeProvaScreen2(blocos: blocos)));
        }
        catch(exception) {
          print(exception);
        }
      })

    :

    ScaffoldMessenger.of(context).showSnackBar(warningMessage);

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
                  padding: EdgeInsets.all(10.0),
                  child: OutlinedButton(
                    child: Text('Remover (${selectedBlocos.length}) selecionados'),
                    onPressed: selectedBlocos.isEmpty
                        ? null
                        : () {
                            deleteSelected();
                          },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: OutlinedButton(
                    child: Text('Ok'),
                    onPressed: blocos.isEmpty ? null : () { calculate();},
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                // ElevatedButton(
                //   child: Text('Imprimir todas as linhas'),
                //   onPressed: () {
                //     blocos.forEach((u) => print("${u.name} ${u.value}"));
                //   },
                // ),
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
                              print("Onselect");
                              onSelectedRow(b!, bloco);
                            },
                            cells: [
                              DataCell(
                                Text("Bloco #" + bloco.id.toString()),
                              ),
                              DataCell(
                                //Text(user.firstName),
                                TextField(
                                  autofocus: true,
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

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            var bloco = new Bloco();
            bloco.name = "bloco" + (blocos.length + 1).toString();
            bloco.value = "";
            bloco.id = blocos.length + 1;
            blocos.add(bloco);
          });
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
