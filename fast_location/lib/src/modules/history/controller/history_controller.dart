import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Isso é necessário para gerar o código do MobX
part 'history_controller.g.dart';

class HistoryController = _HistoryControllerBase with _$HistoryController;

abstract class _HistoryControllerBase with Store {
  @observable
  ObservableList<String> history = ObservableList<String>();

  // Método para carregar o histórico do armazenamento local
  @action
  Future<void> loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedHistory = prefs.getStringList('history') ?? [];
    history.clear();
    history.addAll(storedHistory);
  }

  // Método para adicionar um novo item ao histórico
  @action
  Future<void> addHistoryItem(String item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    history.add(item);
    await prefs.setStringList('history', history.toList());
  }
}
