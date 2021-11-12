# Principios SOLID  🚀

Todos sabemos que la POO (Programación Orientada a Objetos) nos permite agrupar entidades con funcionalidades parecidas o relacionadas entre sí, pero esto no implica que los programas no se vuelvan confusos o difíciles de mantener.

<br>

<img height="200" src="https://user-images.githubusercontent.com/53976242/141298526-c2463ca4-5d53-422f-b958-297dbdebf522.png" />


  De hecho, muchos programas acaban volviéndose un monstruo al que se va alimentando según se añaden nuevas funcionalidades, se realiza mantenimiento, etc…

Viendo este problema, Robert C. Martin estableció cinco directrices o principios para facilitarnos a los desarrolladores la labor de crear programas legibles y mantenibles.
  <br>

Estos principios se llamaron S.O.L.I.D. por sus siglas en inglés:
<br>
**S: Single responsibility principle** o Principio de responsabilidad única
  <br>
  <br>
**O: Open/closed principle** o Principio de abierto/cerrado
  <br>
  <br>
**L: Liskov substitution principle** o Principio de sustitución de Liskov
  <br>
  <br>
**I: Interface segregation principle** o Principio de segregación de la interfaz
  <br><br>
**D: Dependency inversion principle** o Principio de inversión de dependencia
  <br><br>
Aplicar estos principios facilitará mucho el trabajo, tanto propio como ajeno (es muy probable que tu código lo acabe leyendo muchos otros desarrolladores a lo largo de su ciclo de vida). Algunas de las ventajas de aplicarlo son:
<br><br>



-Mantenimiento del código más fácil y rápido<br><br>
-Permite añadir nuevas funcionalidades de forma más sencilla<br><br>
-Favorece una mayor reusabilidad y calidad del código, así como la encapsulación<br><br>
Vamos a ver en detalle cada uno de estos principios, junto a ejemplos básicos, que, a pesar de no ser aplicables en el mundo real, espero que aporten la suficiente claridad para que seas capaz de entender y aplicar estos principios en tus desarrollos.
 
 ## **S: Principio de responsabilidad única**
 <br><br>
 Como su propio nombre indica, establece que una clase, componente o microservicio debe ser responsable de una sola cosa (el tan aclamado término “decoupled” en inglés). Si por el contrario, una clase tiene varias responsabilidades, esto implica que el cambio en una responsabilidad provocará la modificación en otra responsabilidad.
 
 ### Considera este ejemplo:
 
 ```DART
 class Coche {
  String marca = "";

  Coche(String marca) {
    this.marca;
  }

  String getMarcaCoche() {
    return marca;
  }

  void guardarCocheDB(Coche coche) {}
}

  
 ```
 
¿Por qué este código viola el principio de responsabilidad única? Para un minuto y piensa un poco ;)

<br><br>
Como podemos observar, la clase Coche permite tanto el acceso a las propiedades de la clase como a realizar operaciones sobre la BBDD, por lo que la clase ya tiene más de una responsabilidad.
<br><br>
Supongamos que debemos realizar cambios en los métodos que realizan las operaciones a la BBDD. En este caso, además de estos cambios, probablemente tendríamos que tocar los nombres o tipos de las propiedades, métodos, etc, cosa que no parece muy eficiente porque solo estamos modificando cosas que tienen que ver con la BBDD, ¿verdad?<br><br>

Para evitar esto, debemos separar las responsabilidades de la clase, por lo que podemos crear otra clase que se encargue de las operaciones a la BBDD:<br><br>

 ```DART
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


  
 ```
 Nuestro programa será mucho más cohesivo y estará más encapsulado aplicando este principio.
 
 # O: Principio abierto/cerrado
 
Establece que las entidades software (clases, módulos y funciones) deberían estar abiertos para su extensión, pero cerrados para su modificación.<br><br>

Si seguimos con la clase Coche:<br><br>
```DART
class Coche {
  String marca = "";

  Coche(String marca) {
    this.marca;
  }

  String getMarcaCoche() {
    return marca;
  }
}

```
<br><br>

Si quisiéramos iterar a través de una lista de coches e imprimir sus marcas por pantalla:
```DART
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

```
<br><br>
Esto no cumpliría el principio abierto/cerrado, ya que si decidimos añadir un nuevo coche de otra marca:
```DART
 List<String> listaDeCoches = [ coche1.marca = "Audi", coche2.marca = "Renault"];
  ```
  <br><br>
  
  También tendríamos que modificar el método que hemos creado anteriormente:
  ```DART
  void imprimirPrecioCoche(List coches){
  
  coches.forEach((element){
    if(element == coche1.marca){
      print(180000);
    }
    if(element == coche2.marca){
      print(25000);
    }
  });
  ```
  <br><br>
  Como podemos ver, para cada nuevo coche habría que añadir nueva lógica al método precioMedioCoche(). Esto es un ejemplo sencillo, pero imagina que tu aplicación crece y crece… ¿cuántas modificaciones tendríamos que hacer? Mejor evitarnos esta pérdida de tiempo y dolor de cabeza, ¿verdad?
  <br><br>
  Para que cumpla con este principio podríamos hacer lo siguiente:
  
  ```DART
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

  ```
  
  <br><br>
  
  Cada coche extiende la clase abstracta Coche e implementa el método abstracto precioMedioCoche().
<br><br>
Así, cada coche tiene su propia implementación del método precioMedioCoche(), por lo que el método imprimirPrecioMedioCoche() itera el array de coches y solo llama al método precioMedioCoche().
<br><br>
Ahora, si añadimos un nuevo coche, precioMedioCoche() no tendrá que ser modificado. Solo tendremos que añadir el nuevo coche al array, cumpliendo así el principio abierto/cerrado.
<br><br>

#Principio de Substitución de Liskov

Declara que una subclase debe ser sustituible por su superclase, y si al hacer esto, el programa falla, estaremos violando este principio.
<br>
Cumpliendo con este principio se confirmará que nuestro programa tiene una jerarquía de clases fácil de entender y un código reutilizable.
<br>
Veamos un ejemplo:
<br><br>
  ```DART
class Coche {
  String marca ;
  
  Coche(String marca ) {
    this.marca;
    
  }

  String getMarcaCoche() {
    return marca;
  }
}


Coche coche1 = Coche("");
Coche coche2 = Coche("");
void main(){
  List<String>  listaDeCoches = [coche1.marca="Audi", coche2.marca="Renault"];
  
  imprimirNumeroAsientos(listaDeCoches);
}

void imprimirNumeroAsientos(List coches) {
 
    if(coche1.marca == "Audi"){
      print("el auto ${coche1.marca} tiene 2 asientos"); 
  }
   if(coche2.marca == "Renault"){
      print("el auto ${coche2.marca} tiene 4 asientos");
    
  }
}
``` 

Esto viola tanto el principio de substitución de Liskov como el de abierto/cerrado. El programa debe conocer cada tipo de Coche y llamar a su método numAsientos() asociado.
<br>
<br>
Así, si añadimos un nuevo coche, el método debe modificarse para aceptarlo.
<br>
<br>
