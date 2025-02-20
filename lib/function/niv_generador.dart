import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mayor_menor/core/singleton.dart';
import 'package:mayor_menor/provider/provider.dart';
import 'package:provider/provider.dart';

JuegoSing sing = JuegoSing.instance;

int? numGenerador(int? nivel, BuildContext context){
  final prov = Provider.of<ListasProvider>(context, listen: false);
  switch (nivel) {
    case 0:{
      sing.find = Random().nextInt(10);
      prov.intentosRestantes = 3;
    }
    break;
    case 1:{
      sing.find = Random().nextInt(20);
      prov.intentosRestantes = 7;
    }
    break;
    case 2:{
      sing.find = Random().nextInt(100);
      prov.intentosRestantes = 19;
    }
    break;
    default:
    sing.find = Random().nextInt(10);
    prov.intentosRestantes = 3;
  }

  return sing.find;
}
