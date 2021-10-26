import 'package:flutter/material.dart';
import 'package:controle_engenharia/corposdeprovascreen.dart';
import 'package:controle_engenharia/teste.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle Engenharia'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: FlutterLogo(size: 72),
                title: Text("Corpos de prova"),
                subtitle: Text("calcular fck, desvio padrão..."),
                isThreeLine: true,
                trailing: Icon(Icons.expand_more_outlined),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return DataTableDemo();
                    }),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


