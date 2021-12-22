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


    for (int id = 0; id < maxValue; id++){

      jsonn = prefs.getString('history$id') ?? "";
      if(jsonn != ""){
        history = History.fromJson(jsonDecode(jsonn));
        print('history$id: \n'+json.encode(history).toString()+"\n");
        _listHistory.add(history);
      }
    }

    return _listHistory;

  }

  Future<void> removeHistory(int index) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<History> list = await retrieveHistory();

    await prefs.remove("history$index");

    int id = (prefs.getInt('historys') ?? 0);
    await prefs.setInt('historys', id-1);

    for(int i = 0; i < id-1; i++){
      await prefs.setString('history$i', json.encode(list[i]));
    }

    int remove = id-1;
    await prefs.remove("history"+remove.toString());

  }
}



