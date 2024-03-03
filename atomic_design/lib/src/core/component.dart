import 'package:atomic_design_flutter/src/core/status.dart';
import 'package:flutter/material.dart';

import 'style.dart';

typedef WidgetBuild<T> = Widget Function(T style);

@immutable
// ignore: must_be_immutable
abstract class Component<T> extends StatelessWidget {
  final TypeComponent type;
  final Style<T> styles;
  late Status<T> status;
  Component({
    super.key,
    required this.styles,
    required this.type,
  }) {
    status = type.fromStatus<T>();
  }

  Widget createComponent({
    WidgetBuild<T>? empty,
    WidgetBuild<T>? loading,
    WidgetBuild<T>? regular,
    WidgetBuild<T>? error,
    required OrElse orElse,
  }) {
    return status.when(styles,
        empty: (style) => empty!(style),
        loading: (style) => loading!(style),
        regular: (style) => regular!(style),
        error: (style) => error!(style),
        orElse: () => orElse());
  }
}
