import 'package:controle_engenharia/Provider/sharedpreferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:controle_engenharia/Common/app_card.dart';
import 'package:controle_engenharia/Common/warningmessages.dart';

class historyScreen extends StatefulWidget {
  const historyScreen({Key? key}) : super(key: key);

  @override
  _historyScreenState createState() => _historyScreenState();
}

class _historyScreenState extends State<historyScreen> {

  var fontSize = 32.0;
  double media = 0.0;
  double somatorio = 0.0;
  double desvioPadrao = 0.0;
  double variacao = 0.0;
  double fck = 0.0;


  void loadValues() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      media = (prefs.getDouble('media') ?? 0.0);
      print(media);
      somatorio = (prefs.getDouble('somatorio') ?? 0.0);
      desvioPadrao = (prefs.getDouble('desvioPadrao') ?? 0.0);
      variacao = (prefs.getDouble('variacao') ?? 0.0);
      fck = (prefs.getDouble('fck') ?? 0.0);
    });
  }

  void upFontSize(double textSize) {
    setState(() {
      this.fontSize >= 42.0 ? ScaffoldMessenger.of(context).showSnackBar(warningMessages().fontSizeMessage) : this.fontSize += 5.0;
    });
  }

  void downFontSize(double textSize) {
    setState(() {
      this.fontSize -= 5.0;
    });
  }


  @override
  void initState() {
    super.initState();
    loadValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cálculos CP"),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              tooltip: "Diminuir fonte",
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
      body: Center(
        child: ListView(
          children: <Widget>[
            AppCard(
              title: Text("Média", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
              subtitle: Text(media.toStringAsFixed(5), style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
              logo: Image(image: AssetImage('assets/icon/average.png')),
            ),
            AppCard(
              title: Text("Somatório", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
              subtitle: Text(somatorio.toStringAsFixed(5), style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
              logo: Image(image: AssetImage('assets/icon/sum.png')),
            ),
            AppCard(
              title: Text("Desvio Padrão", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
              subtitle: Text(desvioPadrao.toStringAsFixed(5), style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
              logo: Image(image: AssetImage('assets/icon/dp.png')),
            ),
            AppCard(
              title: Text("Variação Média", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
              subtitle: Text(variacao.toStringAsFixed(5), style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
              logo: Image(image: AssetImage('assets/icon/variation.png')),
            ),
            AppCard(
              title: Text("FCK", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
              subtitle: Text(fck.toStringAsFixed(5), style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),),
              logo: Image(image: AssetImage('assets/icon/fck.png')),
            ),
          ],
        ),
      ),
    );
  }
}
