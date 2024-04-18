import 'dart:math';

import 'package:flutter/material.dart';

import '../core/datos.dart';

class ListasProvider with ChangeNotifier{

  List<int> _menores = [];
  List<int> _mayores = [];
  List<int> _fin = [];
  double _slider = 0;
  int? _intentosRestantes;

  List<int> get menores => _menores;
  List<int> get mayores => _mayores;
  List<int> get fin => _fin;
  int? get intentosRestantes => _intentosRestantes;

  double get slider => _slider;
  set slider(double value){
    _slider = value;
  }

  void addMenor(int intento){
    _menores.add(intento);
  }
  void addMayor(int intento){
    _mayores.add(intento);
  }
  void addFin(int intento){
    _fin.add(intento);
  }
  set intentosRestantes(int? value){
    _intentosRestantes = value;
    notifyListeners();
  }

  void reset (){
    _menores = [];
    _mayores = [];
  }

JuegoSing sing = JuegoSing();

int? numGenerador(int? nivel, BuildContext context){
  switch (nivel) {
    case 0:{
      sing.find = Random().nextInt(10);
    intentosRestantes = 3;
    }
    break;
    case 1:{
      sing.find = Random().nextInt(20);
      intentosRestantes = 7;
    }
    break;
    case 2:{
      sing.find = Random().nextInt(100);
      intentosRestantes = 19;
    }
    break;
    default:
    sing.find = Random().nextInt(10);
    intentosRestantes = 3;
  }

  return sing.find;
}
actulizar(){
  notifyListeners();
}
}