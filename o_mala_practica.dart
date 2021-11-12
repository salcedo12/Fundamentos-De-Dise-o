class Coche {
  String marca;

  Coche(String marca) {
    this.marca = marca;
  }
  
  String getMarcaCoche() {return marca;}
}
  Coche coche1 = Coche("");
  Coche coche2 = Coche("");
void main(){

  
  List<String> listaDeCoches = [ coche1.marca = "Audi", coche2.marca = "Renault"];
  
  imprimirPrecioCoche(listaDeCoches);
}


void imprimirPrecioCoche(List coches){
  
  coches.forEach((element){
    if(element == coche1.marca){
      print(180000);
    }
    if(element == coche2.marca){
      print(25000);
    }
  });

}