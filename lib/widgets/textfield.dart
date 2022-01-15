import 'package:flutter/material.dart';

import 'constante.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: defpaultPadding),
      decoration: BoxDecoration(
          color: background,
          border: Border.all(color: logincolor, width: 0.5),
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(83, 202, 207, .2),
                blurRadius: 5,
                offset: Offset(0, 10))
          ]),
      child: child,
    );
  }
}
