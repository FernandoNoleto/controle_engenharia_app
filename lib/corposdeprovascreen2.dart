import 'dart:math';
import 'package:flutter/material.dart';
import 'package:controle_engenharia/Objects/blocos.dart';
import 'package:controle_engenharia/Common/app_card.dart';
// import 'package:controle_engenharia/corposdeprovascreen.dart';




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
      aux += double.parse(bloco.value);
    }
    md = (aux / blocos.length);

    return md;
  }

  double somatorio() {
    for(Bloco bloco in blocos){
      sum += (md - double.parse(bloco.value)) * (md - double.parse(bloco.value));
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

  var fontSize = 32.0;
  var media = 0.0;
  var somatorio = 0.0;
  var desvioPadrao = 0.0;
  var variacao = 0.0;
  var fck = 0.0;

  SnackBar warningMessage = SnackBar(
    content: const Text("Limite do tamanho da fonte alcançado!"),
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
      label: "Ok",
      onPressed: () {},
    ),
  );

  @override
  void initState(){
    media = widget.media();
    somatorio = widget.somatorio();
    desvioPadrao = widget.desvioPadrao();
    variacao = widget.variacao();
    fck = widget.fcknow();
  }


  void upFontSize(double textSize) {
    setState(() {
      this.fontSize >= 42.0 ? ScaffoldMessenger.of(context).showSnackBar(warningMessage) : this.fontSize += 5.0;
    });
  }

  void downFontSize(double textSize) {
    setState(() {
      this.fontSize -= 5.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Calculo CP"),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: IconButton(
                tooltip: "Diminutir fonte",
                onPressed: () { downFontSize(fontSize); },
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
                onPressed: () { upFontSize(fontSize); },
                icon: const Icon(
                  Icons.format_size,
                  size: 26.0,
                ),
              ),
          ),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AppCard(
            title: Text("Média", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
            subtitle: Text(media.toStringAsFixed(5), style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
          ),
          AppCard(
            title: Text("Somatório", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
            subtitle: Text(somatorio.toStringAsFixed(5), style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
          ),
          AppCard(
            title: Text("Desvio Padrão", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
            subtitle: Text(desvioPadrao.toStringAsFixed(5), style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
          ),
          AppCard(
            title: Text("Variação Média", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
            subtitle: Text(variacao.toStringAsFixed(5), style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
          ),
          AppCard(
            title: Text("FCK", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
            subtitle: Text(fck.toStringAsFixed(5), style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}
