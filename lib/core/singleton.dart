class JuegoSing {
  static final JuegoSing _singleton = JuegoSing._internal();
  JuegoSing._internal();
  //factory JuegoSing() => _singleton;
  static JuegoSing get instance => _singleton;

  int? find;
  
  int? currentNivel = 0;

  void setLevel(int level) => currentNivel = level;

  void reset() =>currentNivel = 0;
}