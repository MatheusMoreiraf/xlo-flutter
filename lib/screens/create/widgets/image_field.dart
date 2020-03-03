import 'package:flutter/material.dart';
import 'package:xlo/screens/create/widgets/image_source_sheet.dart';

class ImageField extends StatelessWidget {
  final FormFieldSetter<List> onSaved;
  final List initialValue;

  ImageField({@required this.initialValue, @required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return FormField<List>(
      initialValue: initialValue,
      validator: (images) {
        if (images.isEmpty) return 'Campo obrigatório';
        return null;
      },
      onSaved: onSaved,
      builder: (state) {
        return Column(
          children: <Widget>[
            Container(
              color: Colors.grey[200],
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.value.length + 1,
                itemBuilder: (context, index) {
                  if (index == state.value.length)
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => ImageSourceSheet((image) {
                            if (image != null)
                              state.didChange(state.value..add(image));
                            Navigator.of(context).pop();
                          }),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          top: 16,
                          bottom: 16,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: 52,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.camera_alt,
                                size: 50,
                                color: Colors.white,
                              ),
                              Text(
                                '+ inserir',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Image.file(state.value[index]),
                              FlatButton(
                                onPressed: () {
                                  state.didChange(state.value..removeAt(index));
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Escluir'),
                                color: Colors.red,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 16,
                        bottom: 16,
                      ),
                      child: CircleAvatar(
                        radius: 52,
                        backgroundImage: FileImage(state.value[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (state.hasError)
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  state.errorText,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
