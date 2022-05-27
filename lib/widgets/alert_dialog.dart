import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  final String mensaje;
  const AlertWidget({Key? key, required this.mensaje,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: Text('Notificaciones'),
      content: Text(mensaje),
      actions: <Widget>[
        FlatButton(
            child: const Text("Accept"),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.of(context).pop();
            })
      ],
    );
  }
}
