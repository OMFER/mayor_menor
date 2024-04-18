class JuegoSing {
  static final JuegoSing _singleton = JuegoSing._internal();
  factory JuegoSing() => _singleton;
  JuegoSing._internal();

  int? find;
  
  int? currentNivel = 0;
  

  void reset (){
    //find = numGenerador(0);
    currentNivel = 0;
  }
}