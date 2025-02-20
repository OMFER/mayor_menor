import 'package:flutter/material.dart';
import 'package:mayor_menor/core/singleton.dart';
import 'package:mayor_menor/provider/provider.dart';
import 'package:provider/provider.dart';

JuegoSing sing = JuegoSing.instance;
//final prov = Provider(create: (context) => Provider.of<ListasProvider>);

void evaluardor(int nivel, int intento, BuildContext context){
final prov = Provider.of<ListasProvider>(context, listen: false);
  if (prov.intentosRestantes > 0){
    if(intento == sing.find){
      prov.fin.add(intento);
      prov.reset();
      prov.numGenerador(nivel, context);
    }else if(intento < sing.find){
      prov.menores.add(intento);
      prov.intentosRestantes - 1;
    } else {
      prov.mayores.add(intento);
      prov.intentosRestantes - 1;
    }
  } else {
    prov.fin.add(intento);
    prov.reset();
  }
}