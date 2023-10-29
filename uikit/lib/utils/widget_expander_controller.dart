import 'package:flutter/material.dart';

typedef Emitter = Widget Function(
  WidgetExpanderController,
  List<Widget> widgets,
);

class WidgetExpanderController extends ValueNotifier<List<Widget>> {
  final List<ChangeNotifier> _disposable = [];
  List<ChangeNotifier> get disposable => _disposable;

  WidgetExpanderController({
    required Emitter emitter,
    required List<Widget> children,
  }) : super(children) {
    value.add(emitter(this, value));
  }

  void call(Widget child) {
    final emitter = value.removeLast();
    value.add(child);
    value.add(emitter);
    notifyListeners();
  }

  void all(Iterable<Widget> children) {
    final emitter = value.removeLast();
    value.addAll(children);
    value.add(emitter);
    notifyListeners();
  }

  void removeEmitter() {
    value.removeLast();
    notifyListeners();
  }

  void addDisposable(ChangeNotifier disposable) {
    _disposable.add(disposable);
  }

  @override
  void dispose() {
    for (var element in _disposable) {
      element.dispose();
    }
    super.dispose();
  }
}
