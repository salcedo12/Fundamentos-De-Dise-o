abstract class Coche {
  int numAsientos();
}

class Renault extends Coche {
  String marca = "Renault";
  @override
  int numAsientos() {
    return 4;
  }
}

class Toyota extends Coche {
  @override
  int numAsientos() {
    return 6;
  }
}

main() {
  Renault renault = Renault();
  Toyota toyota = Toyota();

  List<int> arrayCoches = [renault.numAsientos(), toyota.numAsientos()];

  imprimirNumeroAsientos(arrayCoches);
}

void imprimirNumeroAsientos(List coches) {
  Renault renault = Renault();
  for (var element = 0; element < coches.length; element++) {
    print("${renault.marca}  tiene ${coches[element]} asientos");
  }
}
