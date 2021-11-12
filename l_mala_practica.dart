class Coche {
  String marca;

  Coche(String marca) {
    this.marca;
  }

  String getMarcaCoche() {
    return marca;
  }
}

Coche coche1 = Coche("");
Coche coche2 = Coche("");
Coche coche3 = Coche("");

void main() {
  List<String> listaDeCoches = [
    coche1.marca = "Audi",
    coche2.marca = "Renault",
    coche3.marca = "Toyota TXL"
  ];

  imprimirNumeroAsientos(listaDeCoches);
}

void imprimirNumeroAsientos(List coches) {
  if (coche1.marca == "Audi") {
    print("el auto ${coche1.marca} tiene 2 asientos");
  }
  if (coche2.marca == "Renault") {
    print("el auto ${coche2.marca} tiene 4 asientos");
  }
  if (coche3.marca == "Toyota TXL") {
    print("el auto ${coche3.marca} tiene 6 asientos");
  }
}
