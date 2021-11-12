abstract class IAve {
  void comer();
}

abstract class IAveVoladora {
  void volar();
}

abstract class IAveNadadora {
  void nadar();
}

class Loro implements IAve, IAveVoladora {
  @override
  void volar() {
    return print("el Loro puede volar");
  }

  @override
  void comer() {
    return print("el Loro puede Comer");
  }
}

class Pinguino implements IAve, IAveNadadora {
  @override
  void nadar() {
    return print("el Pinguino puede Nadar");
  }

  @override
  void comer() {
    return print("el Pinguino puede comer");
  }
}

main() {
  Loro loro = Loro();
  loro.volar();

  Pinguino pinguino = Pinguino();
  pinguino.nadar();
}
