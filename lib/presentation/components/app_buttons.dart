import 'package:flutter/material.dart';

import 'app_texts.dart';
import 'components.dart';

class ButtonFilled extends StatelessWidget {
  final String text;
  final Function onPressed;
  const ButtonFilled({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed(),
      child: HeadlineMedium(
        text: text,
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  final String? text;
  final Function onPressed;
  final IconData? icon;
  const ButtonText({
    Key? key,
    this.text,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: Row(
        children: [
          text != null ? HeadlineMedium(text: text!) : const Nothing(),
          text != null && icon != null
              ? const HSpacer(width: 3)
              : const Nothing(),
          icon != null ? Icon(icon) : const Nothing()
        ],
      ),
    );
  }
}
