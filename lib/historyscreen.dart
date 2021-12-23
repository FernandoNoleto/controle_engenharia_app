import 'package:controle_engenharia/Objects/history.dart';
import 'package:controle_engenharia/Provider/persist.dart';
import 'package:flutter/material.dart';

import 'package:controle_engenharia/Objects/blocos.dart';
import 'package:controle_engenharia/Common/warningmessages.dart';

class historyScreen extends StatefulWidget {
  const historyScreen({Key? key}) : super(key: key);

  @override
  _historyScreenState createState() => _historyScreenState();
}

class _historyScreenState extends State<historyScreen> {
  late List<Bloco> blocos;

  var fontSize = 15.0;
  double media = 0.0;
  double somatorio = 0.0;
  double desvioPadrao = 0.0;
  double variacao = 0.0;
  double fck = 0.0;

  List<History> listHistory = [];
  bool haveHistorys = false;

  /// *****************************************************************************************/

  void loadValues() async {
    listHistory = await Persist().retrieveHistory();

    setState(() {
      listHistory.isEmpty ? haveHistorys = false : haveHistorys = true;
    });
  }

  void _onDeleteItemPressed(int index) {
    print("remove at index: $index");
    print("----------------------");
    setState(() {
      listHistory.removeAt(index);
      Persist().removeHistory(index);
      listHistory.isEmpty ? haveHistorys = false : haveHistorys = true;
    });
  }

  void upFontSize(double textSize) {
    setState(() {
      this.fontSize >= 42.0
          ? ScaffoldMessenger.of(context)
              .showSnackBar(warningMessages().fontSizeMessage)
          : this.fontSize += 3.0;
    });
  }

  void downFontSize(double textSize) {
    setState(() {
      this.fontSize -= 3.0;
    });
  }

  void debug(int index) {
    print("valor do index: " + index.toString() + '\n');
    for (Bloco bloco in listHistory[index].blocos) {
      print(bloco.name + ' => ' + bloco.value.toString());
    }
  }

  @override
  void initState() {
    loadValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Histórico de cálculos",
        ),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              tooltip: "Diminuir fonte",
              onPressed: () {
                downFontSize(fontSize);
              },
              icon: const Icon(
                Icons.format_size,
                size: 18.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              tooltip: "Aumentar fonte",
              onPressed: () {
                upFontSize(fontSize);
              },
              icon: const Icon(
                Icons.format_size,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: haveHistorys
          ? Center(
              child: ListView.builder(
                  padding: const EdgeInsets.all(5.5),
                  itemCount: listHistory.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.blueGrey,
                      elevation: 10,
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            tileColor: Colors.black12,
                            title: Center(
                                child: Text(
                                  listHistory[index].date,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            trailing: IconButton(
                              tooltip: "Deletar histórico",
                              icon: Icon(
                                Icons.delete_forever,
                                size: 25.0,
                              ),
                              onPressed: () {
                                _onDeleteItemPressed(index);
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  for (Bloco bloco in listHistory[index].blocos)
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        // margin: const EdgeInsets.all(1),
                                        padding: const EdgeInsets.all(2),
                                        child: Text(
                                          bloco.name +
                                              ' => ' +
                                              bloco.value.toString(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: fontSize,
                                              fontWeight: FontWeight.bold),
                                        )), //blocos
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                      padding: const EdgeInsets.all(2),
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        "Media: " +
                                            listHistory[index]
                                                .calculation
                                                .media
                                                .toStringAsFixed(2),
                                        style: TextStyle(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                      padding: const EdgeInsets.all(2),
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        "Somatorio: " +
                                            listHistory[index]
                                                .calculation
                                                .somatorio
                                                .toStringAsFixed(2),
                                        style: TextStyle(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                      padding: const EdgeInsets.all(2),
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        "Desvio Padrão: " +
                                            listHistory[index]
                                                .calculation
                                                .desvioPadrao
                                                .toStringAsFixed(2),
                                        style: TextStyle(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                      padding: const EdgeInsets.all(2),
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        "Variação media: " +
                                            listHistory[index]
                                                .calculation
                                                .variacao
                                                .toStringAsFixed(2),
                                        style: TextStyle(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                      padding: const EdgeInsets.all(2),
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        "FCK: " +
                                            listHistory[index]
                                                .calculation
                                                .fck
                                                .toStringAsFixed(2),
                                        style: TextStyle(
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.history_toggle_off_sharp,
                    size: 250.0,
                    color: Colors.blueGrey,
                  ),
                  Text("Não há históricos salvos",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey)),
                ],
              ),
            ),
    );
  }
}
