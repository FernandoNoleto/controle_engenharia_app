import 'package:controle_engenharia/Objects/calculations.dart';
import 'package:controle_engenharia/Objects/blocos.dart';

List<History> historys = [];

class History {
  String date;
  Calculation calculation;
  List<Bloco> blocos;

  History(this.date, this.calculation, this.blocos);

  static List<History> getHistory() {
    return historys;
  }

  void addHistory(date, calculation, List<Bloco> blocos) {
    var history = new History("", Calculation(0.0, 0.0, 0.0, 0.0, 0.0), []);
    history.date = date;
    history.calculation = calculation;
    history.blocos = blocos;
    historys.add(history);
  }

  factory History.fromJson(dynamic json) {
    if (json['blocos'] != null) {
      var blocoObjsJson = json['blocos'] as List;
      List<Bloco> _blocos =
          blocoObjsJson.map((blocoJson) => Bloco.fromJson(blocoJson)).toList();

      return History(json['date'] as String,
          Calculation.fromJson(json['calculation']), _blocos);
    } else {
      return History(json['date'] as String,
          Calculation.fromJson(json['calculation']), []);
    }
  }

  Map toJson() => {
        'date': date,
        'calculation': calculation,
        'blocos': blocos,
      };
}
