import 'package:flutter/material.dart';
import 'package:desafioteste/widgets/textfield.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.13),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          TextFieldContainer(
            child: TextFormField(
              validator: (value) =>
                  value != "covid@gmail.com" ? "Email Incorreto" : null,
              decoration: const InputDecoration(hintText: " Email"),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          TextFieldContainer(
            child: TextFormField(
              validator: (value) =>
                  value != "1234567" ? "Senha Incorreta" : null,
              obscureText: true,
              decoration: const InputDecoration(hintText: " Senha"),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
