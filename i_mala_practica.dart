abstract class IAve {
  void volar();
  void comer();
}

class Loro implements IAve {
  @override
  void volar() {
    return print("EL loro puede volar");
  }

  @override
  void comer() {
    return print("EL loro puede comer");
  }
}

class Tucan implements IAve {
  @override
  void volar() {
    return print("EL Tucan puede Volar");
  }

  @override
  void comer() {
    return print("EL Tucan puede comer");
  }
}

void main() {
  Loro loro = Loro();
  loro.volar();

  Tucan tucan = Tucan();
  tucan.comer();
}

