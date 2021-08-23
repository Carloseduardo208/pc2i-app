import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pc2i_app/components/button.dart';
import 'package:pc2i_app/components/input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Entrar',
                    style: GoogleFonts.quicksand(
                      color: Color(0xff171717),
                      decoration: TextDecoration.none,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        child: Image.asset('assets/logo.png'),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Input(
                          icon: Icon(Icons.person_outline),
                          placeholder: 'Nome de usuário ou e-mail',
                        ),
                        SizedBox(height: 15),
                        Input(
                          icon: Icon(Icons.lock_outline),
                          placeholder: 'Sua senha',
                          action: TextInputAction.send,
                          isSecret: true,
                        ),
                        SizedBox(height: 35),
                        Button(
                          icon: Icons.login_outlined,
                          text: 'Entrar',
                          action: () {},
                        ),
                        SizedBox(height: 25),
                        Divider(
                          height: 0.5,
                          color: Color(0xff2db3fa),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Não possui uma conta?'),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/signup');
                              },
                              child: Text('Cadastre-se'),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: () {},
                          child: Text('Esqueceu sua senha?'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
