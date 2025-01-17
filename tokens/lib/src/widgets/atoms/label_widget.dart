import 'package:atomic_design_flutter/atomic_design_flutter.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LabelWidget extends LabelComponent {
  LabelWidget._(
      {required super.text, required super.type, required super.styles});

  factory LabelWidget.regular(
    String text, {
    required TypeComponent type,
  }) =>
      LabelWidget._(
        text: text,
        type: type,
        styles: LabelStyles.regular(),
      );
}

class LabelStyles {
  static Style<LabelStyle> regular() => Style<LabelStyle>(
      loading: LabelStyle(
        textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.red,
        ),
      ),
      regular: LabelStyle(
        textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.red,
        ),
      ));
}
