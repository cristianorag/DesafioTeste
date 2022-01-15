import 'package:flutter/material.dart';

import 'constante.dart';

class LoginButton extends StatelessWidget {
  final Function() press;

  const LoginButton({Key? key, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.13),
      child: GestureDetector(
        onTap: press,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: logincolor),
          child: const Center(
            child: Text(
              "Login",
              style: TextStyle(color: background, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
