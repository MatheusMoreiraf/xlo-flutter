import 'package:flutter/material.dart';
import 'package:xlo/helpers/format_fild.dart';
import 'package:xlo/screens/signup/widgets/field_title.dart';
import 'package:xlo/screens/signup/widgets/password_field.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Cadastrar'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            const FieldTitle(
              title: 'Apelido',
              subtitle: 'Como Aparecerá em seus anúncios.',
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Exemplo: João S.'),
              validator: (text) {
                if (text.length < 6)
                  return 'Apelido muito curto';
                else
                  return null;
              },
            ),
            SizedBox(height: 26),
            const FieldTitle(
              title: 'E-mail',
              subtitle: 'Enviaremos um e-mail de confirmação.',
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              validator: (text) {
                if (text.length < 6 || !isEmailValid(text))
                  return 'E-mail inválido';
                else
                  return null;
              },
            ),
            SizedBox(height: 26),
            const FieldTitle(
              title: 'Senha',
              subtitle: 'Use letras, números e caracteres especiais.',
            ),
            PasswordField(
              onSaved: (text) {},
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              height: 50,
              child: RaisedButton(
                color: Colors.pink,
                disabledColor: Colors.pink.withAlpha(150),
                child: Text(
                  'Cadastrer-se',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
                ),
                onPressed: _signUp,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _signUp() {
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();


    }
  }
}