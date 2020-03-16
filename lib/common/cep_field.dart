import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo/models/address.dart';

class CepField extends StatefulWidget {
  final InputDecoration decoration;
  final FormFieldSetter<Address> onSaved;

  CepField({this.decoration, this.onSaved});

  @override
  _CepFieldState createState() => _CepFieldState();
}

class _CepFieldState extends State<CepField> {
  FormFieldSetter<Address> get onSaved => widget.onSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [
            WhitelistingTextInputFormatter.digitsOnly,
            CepInputFormatter(),
          ],
          decoration: widget.decoration,
          onSaved: (t) {
            onSaved(Address());
          },
        ),
      ],
    );
  }
}