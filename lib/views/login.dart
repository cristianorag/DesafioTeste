import 'package:desafioteste/views/lista.dart';
import 'package:desafioteste/widgets/logbutton.dart';
import 'package:desafioteste/widgets/loginform.dart';
import 'package:flutter/material.dart';

class PaginaDeLogin extends StatefulWidget {
  const PaginaDeLogin({Key? key}) : super(key: key);

  @override
  State<PaginaDeLogin> createState() => _PaginaDeLoginState();
}

class _PaginaDeLoginState extends State<PaginaDeLogin> {
  final _formkey = GlobalKey<FormState>();

  get background => null;
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: background,
      body: Form(
        key: _formkey,
        child: Stack(
          children: <Widget>[
            Positioned(
                width: _size.width,
                top: _size.height * 0.15,
                child: CircleAvatar(
                    radius: 35,
                    backgroundColor: background,
                    child: Image.asset("assets/avatar1.png"))),
            Positioned(
                width: _size.width,
                height: _size.height,
                top: _size.height * 0.1,
                child: const LoginForm()),
            Positioned(
              width: _size.width,
              top: _size.height * 0.65,
              child: LoginButton(
                press: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListPage()));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
