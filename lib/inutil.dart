import 'package:flutter/material.dart';

import 'package:controle_engenharia/inutil2.dart';

/// This is the stateful widget that the main application instantiates.
class CorposDeProvaScreen extends StatefulWidget {
  const CorposDeProvaScreen({Key? key}) : super(key: key);

  @override
  State<CorposDeProvaScreen> createState() => _CorposDeProvaScreenState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _CorposDeProvaScreenState extends State<CorposDeProvaScreen> {
  String dropdownValue = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Corpos de Prova'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text("Digite a quantidade de corpos de prova"),
          ),
          Center(
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.blueGrey,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CorposDeProva2Screen(
                              numeroCorposdeProva: newValue,
                            )),
                  );
                });
              },
              items: <String>[
                '1',
                '2',
                '3',
                '4',
                '5',
                '6',
                '7',
                '8',
                '9',
                '10',
                '11',
                '12',
                '13',
                '14',
                '15',
                '16',
                '17',
                '18',
                '19',
                '20'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Center(
            child: Text(dropdownValue),
          ),
        ],
      ),
    );
  }
}
