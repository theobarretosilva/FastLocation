import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fast_location/src/modules/home/model/endereco_model.dart';

part 'history_controller.g.dart';

class HistoryController = _HistoryControllerBase with _$HistoryController;

abstract class _HistoryControllerBase with Store {
  @observable
  ObservableList<Endereco> history = ObservableList<Endereco>();

  @action
  Future<void> loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedHistory = prefs.getStringList('history') ?? [];

    history.clear();
    history.addAll(
      storedHistory.map((jsonString) => Endereco.fromJson(jsonString)).toList(),
    );
  }

  @action
  Future<void> addHistoryItem(Endereco endereco) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    history.add(endereco);

    List<String> jsonHistory =
        history.map((endereco) => endereco.toJson()).toList();
    
    await prefs.setStringList('history', jsonHistory);
  }
}
