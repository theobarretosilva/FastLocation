// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoryController on _HistoryControllerBase, Store {
  late final _$historyAtom =
      Atom(name: '_HistoryControllerBase.history', context: context);

  @override
  ObservableList<String> get history {
    _$historyAtom.reportRead();
    return super.history;
  }

  @override
  set history(ObservableList<String> value) {
    _$historyAtom.reportWrite(value, super.history, () {
      super.history = value;
    });
  }

  late final _$loadHistoryAsyncAction =
      AsyncAction('_HistoryControllerBase.loadHistory', context: context);

  @override
  Future<void> loadHistory() {
    return _$loadHistoryAsyncAction.run(() => super.loadHistory());
  }

  late final _$addHistoryItemAsyncAction =
      AsyncAction('_HistoryControllerBase.addHistoryItem', context: context);

  @override
  Future<void> addHistoryItem(String item) {
    return _$addHistoryItemAsyncAction.run(() => super.addHistoryItem(item));
  }

  @override
  String toString() {
    return '''
history: ${history}
    ''';
  }
}
