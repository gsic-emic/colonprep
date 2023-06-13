import 'package:flutter/material.dart';
import 'package:hospital/models/cards.dart';
import 'package:hospital/models/colonprep_info.dart';

abstract class State {
  Widget loadMainScreen(BuildContext context, ColonprepInfo cpi, Cards cardsFuture, double ancho, double alto);
}