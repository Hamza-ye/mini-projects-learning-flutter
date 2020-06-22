import 'package:flutter/material.dart';

class _ModelBindingScope<T> extends InheritedWidget {
  const _ModelBindingScope({Key key, this.modelBindingState, Widget child})
      : super(key: key, child: child);
  final _ModelBindingState<T> modelBindingState;
  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
}
