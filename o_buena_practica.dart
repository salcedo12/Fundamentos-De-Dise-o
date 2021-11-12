abstract class Coche {
  int precioMedioCoche();
}

class Renault extends Coche {
  @override
  int precioMedioCoche() {
    return 18000;
  }
}

class Audi extends Coche {
  @override
  int precioMedioCoche() {
    return 25000;
  }
}

class Mercedes extends Coche {
  @override
  int precioMedioCoche() {
    return 27000;
  }
}

main() {
  Renault renault = Renault();
  Audi audi = Audi();
  Mercedes mercedes = Mercedes();
  List<int> listaDeCoche = [
    renault.precioMedioCoche(),
    audi.precioMedioCoche(),
    mercedes.precioMedioCoche()
  ];
  imprimirPrecioCoche(listaDeCoche);
}

void imprimirPrecioCoche(List coches) {
  for (var element in coches) {
    print(element);
  }
}
