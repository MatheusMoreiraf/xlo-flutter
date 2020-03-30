import 'package:flutter/material.dart';

class HidePhoneWidget extends FormField<bool> {
  HidePhoneWidget({
    @required FormFieldSetter<bool> onSaved,
    @required bool initialValue,
  }) : super(
          initialValue: initialValue,
          onSaved: onSaved,
          builder: (state) {
            return Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: state.value,
                    onChanged: (b) {
                      state.didChange(b);
                    },
                  ),
                  const Text('Ocutar o Meu telefone neste anúncio')
                ],
              ),
            );
          },
        );
}
