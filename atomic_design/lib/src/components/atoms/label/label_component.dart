import 'package:atomic_design_flutter/src/core/component.dart';
import 'package:flutter/material.dart';

import 'label_style.dart';

// ignore: must_be_immutable
class LabelComponent extends Component<LabelStyle> {
  final String text;
  LabelComponent({
    super.key,
    required super.type,
    required super.styles,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return super.createComponent(
      regular: (style) => Text(
        text,
        style: style.textStyle,
      ),
      loading: (_) => const CircularProgressIndicator(),
      orElse: () => Container(),
    );
  }
}
