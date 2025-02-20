import 'dart:math';

import 'package:flutter/material.dart';

import '../core/singleton.dart';

class ListasProvider with ChangeNotifier{

  List<int> _menores = [];
  List<int> _mayores = [];
  List<int> _fin = [];
  double _slider = 0;
  int? _intentosRestantes;
  int? _tope = 0;

  List<int> get menores => _menores;
  List<int> get mayores => _mayores;
  List<int> get fin => _fin;
  int? get intentosRestantes => _intentosRestantes;
  int? get tope => _tope;

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

  set tope(int? value){
    _tope = value;
    notifyListeners();
  }

  void reset (){
    _menores = [];
    _mayores = [];
  }

JuegoSing sing = JuegoSing.instance;

int? numGenerador(int? nivel, BuildContext context){
  switch (nivel) {
    case 0:{
      sing.find = Random().nextInt(10);
      intentosRestantes = 3;
      tope = 9;
    }
    break;
    case 1:{
      sing.find = Random().nextInt(20);
      intentosRestantes = 7;
      tope = 19;
    }
    break;
    case 2:{
      sing.find = Random().nextInt(100);
      intentosRestantes = 19;
      tope = 99;
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