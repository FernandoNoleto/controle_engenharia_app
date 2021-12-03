import 'package:flutter/material.dart';


class warningMessages{

  SnackBar fontSizeMessage = SnackBar(
    content: const Text("Limite do tamanho da fonte alcançado!"),
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
      label: "Ok",
      onPressed: () {},
    ),
  );


  SnackBar twoFieldsMessage = SnackBar(
    content: const Text("Para continuar preencha pelo menos 2 campos!"),
    action: SnackBarAction(
      label: "Ok",
      onPressed: () {},
    ),
  );

  SnackBar blankFieldMessage = SnackBar(
    content: const Text("Algum campo está vazio!"),
    action: SnackBarAction(
      label: "Ok",
      onPressed: () {},
    ),
  );

}