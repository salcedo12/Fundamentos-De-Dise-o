class Coche {
  String marca = "";

  Coche(String marca) {
    this.marca;
  }

  String getMarcaCoche() {
    return marca;
  }
}

class CocheDB {
  void guardarCocheDB(Coche coche) {...}
  void eliminarCoccheDB(Coche coche) {...}
}
