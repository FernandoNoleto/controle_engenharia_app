import 'dart:math';

import 'package:flutter/material.dart';
import 'package:controle_engenharia/Objects/blocos.dart';

class corposDeProvaScreen2 extends StatelessWidget {
  corposDeProvaScreen2({Key? key, required this.blocos}) : super(key: key);

  final List<Bloco> blocos;
  double md = 0;
  double sum = 0;
  double dp = 0;
  double vrc = 0;
  double fck = 0;

  void mostrarValores() {
    // print(blocos);
    for (Bloco bloco in blocos) {
      print(bloco.value);
    }
  }

  double media() {
    double aux = 0;
    // double media = 0;
    for (Bloco bloco in blocos) {
      aux += int.parse(bloco.value);
    }
    md = (aux / blocos.length);
    return md;
  }

  double somatorio() {
    for(Bloco bloco in blocos){
      sum += (md - int.parse(bloco.value)) * (md - int.parse(bloco.value));
    }

    return sum;
  }

  double desvioPadrao(){
    double aux = sum / (blocos.length - 1);
    dp = (sqrt(aux));
    return dp;
  }


  double variacao(){
    vrc = dp / md * 100;
    return vrc;
  }


  double fcknow(){
    fck = (md - (1.65 * dp));
    return fck;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Calculo CP"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Card(
              elevation: 10,
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ListTile(
                leading: FlutterLogo(
                  size: 72.0,
                ),
                title: Text("Media", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                subtitle: Text(media().toStringAsPrecision(3), style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
              ),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 10,
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ListTile(
                leading: FlutterLogo(
                  size: 72.0,
                ),
                title: Text("Somatorio", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                subtitle: Text(somatorio().toStringAsPrecision(3), style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
              ),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 10,
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ListTile(
                leading: FlutterLogo(
                  size: 72.0,
                ),
                title: Text("Desvio Padrão", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                subtitle: Text(desvioPadrao().toStringAsPrecision(3), style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
              ),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 10,
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ListTile(
                leading: FlutterLogo(
                  size: 72.0,
                ),
                title: Text("Variação media", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                subtitle: Text(variacao().toStringAsPrecision(3), style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
              ),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 10,
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ListTile(
                leading: FlutterLogo(
                  size: 72.0,
                ),
                title: Text("FCK", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                subtitle: Text(fcknow().toStringAsPrecision(3), style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
