import 'package:controle_engenharia/Common/app_card.dart';
import 'package:flutter/material.dart';
import 'package:controle_engenharia/corposdeprovascreen.dart';

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
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            AppCard(
              title: Text(
                "Corpos de prova",
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Calcular fck, desvio padrão, coeficiente de variação...",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return corposDeProvaScreen();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
