import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:controle_engenharia/Objects/history.dart';


class Persist{

  List<History> _listHistory = [];

  void storeHistory(History history) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    int id = (prefs.getInt('historys') ?? 0);
    print("ID:$id");
    await prefs.setInt('historys', id+1);


    print("------------Entrou no guardar historico------------\n");
    print('para Json: \n'+json.encode(history).toString()+"\n");
    await prefs.setString('history$id', json.encode(history));

  }


  Future<List<History>> retrieveHistory()  async {

    SharedPreferences prefs = await SharedPreferences.getInstance();


    String jsonn = "";
    History history;
    int maxValue = (prefs.getInt('historys') ?? 0);
    print("Max value: $maxValue");


    for (int id = 0; id <= maxValue; id++){

      jsonn = prefs.getString('history$id') ?? "";
      if(jsonn != ""){
        history = History.fromJson(jsonDecode(jsonn));
        print('history$id: \n'+json.encode(history).toString()+"\n");
        _listHistory.add(history);
      }
      jsonn = "";
    }

    return _listHistory;

  }

  Future<void> removeHistory(int index) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove("history$index");

    List<History> list = await retrieveHistory();

    int id = (prefs.getInt('historys') ?? 0);


    print("*******************************************\n");
    for (History hist in list) {
      print('Lista de Historys: \n'+json.encode(hist).toString()+"\n");
    }

    print("ID: $id");
    for(int i = 0; i < id-1; i++){

      print("i: $i");
      await prefs.setString('history$i', json.encode(list[i]));
    }

    await prefs.setInt('historys', id-1);
    int remove = id-1;
    await prefs.remove("history"+remove.toString());

  }
}



