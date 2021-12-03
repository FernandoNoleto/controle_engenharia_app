import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class sharedPreferences extends StatefulWidget {
//   const sharedPreferences({Key? key}) : super(key: key);
//
//   @override
//   _sharedPreferencesState createState() => _sharedPreferencesState();
// }
//
// class _sharedPreferencesState extends State<sharedPreferences> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
//
//   late double media;
//   late double somatorio;
//   late double desvioPadrao;
//   late double variacao;
//   late double fck;
//
//
//   void loadValues() async{
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       media = (prefs.getDouble("media") ?? 0.0);
//       somatorio = (prefs.getDouble("somatorio") ?? 0.0);
//       desvioPadrao = (prefs.getDouble("desvioPadrao") ?? 0.0);
//       variacao = (prefs.getDouble("variacao") ?? 0.0);
//       fck = (prefs.getDouble("fck") ?? 0.0);
//
//     });
//   }
//
//   void writeValues(media, somatorio, desvioPadrao, variacao, fck) async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       prefs.setDouble('media', media);
//       prefs.setDouble('somatorio', somatorio);
//       prefs.setDouble('desvioPadrao', desvioPadrao);
//       prefs.setDouble('variacao', variacao);
//       prefs.setDouble('fck', fck);
//     });
//   }
//
//
// }
//


class sharedPreferences {

  double media = 0.0;
  double somatorio = 0.0;
  double desvioPadrao = 0.0;
  double variacao = 0.0;
  double fck = 0.0;

  // late List<Double> values;

  void loadValues() async {
    final prefs = await SharedPreferences.getInstance();

    media = (prefs.getDouble('media') ?? 0.0);
    print(media);
    somatorio = (prefs.getDouble('somatorio') ?? 0.0);
    desvioPadrao = (prefs.getDouble('desvioPadrao') ?? 0.0);
    variacao = (prefs.getDouble('variacao') ?? 0.0);
    fck = (prefs.getDouble('fck') ?? 0.0);
  }

  void writeValues(media, somatorio, desvioPadrao, variacao, fck) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setDouble('media', media);
    prefs.setDouble('somatorio', somatorio);
    prefs.setDouble('desvioPadrao', desvioPadrao);
    prefs.setDouble('variacao', variacao);
    prefs.setDouble('fck', fck);
  }

}



