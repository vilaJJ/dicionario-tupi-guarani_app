import 'package:flutter/material.dart';

class DimensoesTelaHelper {
  final BuildContext context;

  DimensoesTelaHelper.of(this.context);

  double obterAltura({
    double percentual = 1,
  }) {
    return MediaQuery.of(context).size.height * percentual;
  }

  double obterLargura({
    double percentual = 1,
  }) {
    return MediaQuery.of(context).size.width * percentual;
  }
}
