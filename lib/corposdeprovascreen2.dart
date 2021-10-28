import 'dart:math';
import 'package:flutter/material.dart';
import 'package:controle_engenharia/Objects/blocos.dart';


class corposDeProvaScreen2 extends StatefulWidget {
  corposDeProvaScreen2({Key? key, required this.blocos}) : super(key: key);

  final List<Bloco> blocos;
  double md = 0;
  double sum = 0;
  double dp = 0;
  double vrc = 0;
  double fck = 0;

  double media(){
    double aux = 0;
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
  _corposDeProvaScreen2State createState() => _corposDeProvaScreen2State();
}

class _corposDeProvaScreen2State extends State<corposDeProvaScreen2> {


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
                title: Text("Média", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                subtitle: Text(widget.media().toStringAsPrecision(3), style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
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
                title: Text("Somatório", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                subtitle: Text(widget.somatorio().toStringAsPrecision(3), style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
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
                subtitle: Text(widget.desvioPadrao().toStringAsPrecision(3), style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
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
                title: Text("Variação média", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                subtitle: Text(widget.variacao().toStringAsPrecision(3), style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
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
                subtitle: Text(widget.fcknow().toStringAsPrecision(3), style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
