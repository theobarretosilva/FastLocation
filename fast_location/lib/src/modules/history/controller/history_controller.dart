import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fast_location/src/modules/home/model/endereco_model.dart';

part 'history_controller.g.dart';

class HistoryController = _HistoryControllerBase with _$HistoryController;

abstract class _HistoryControllerBase with Store {
  @observable
  ObservableList<String> history = ObservableList<String>();

  @action
  Future<void> loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedHistory = prefs.getStringList('history') ?? [];
    history.clear();
    history.addAll(storedHistory);
  }

  @action
  Future<void> addHistoryItem(Endereco endereco) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    history.add(endereco);
    await prefs.setStringList('history', history.toList());
  }
}
