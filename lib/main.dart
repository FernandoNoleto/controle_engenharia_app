import 'package:flutter/material.dart';
// import 'package:controle_engenharia/inutil.dart';
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
                subtitle: Text("Calcular fck, desvio padrão, coeficiente de variação..."),
                isThreeLine: true,
                // trailing: Icon(Icons.expand_more_outlined),
                trailing: TextButton(child: Icon(Icons.expand_more, color: Colors.blueGrey,), onPressed: (){},),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return corposDeProvaScreen();
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


