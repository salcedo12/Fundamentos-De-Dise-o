# Principios SOLID  🚀

Todos sabemos que la POO (Programación Orientada a Objetos) nos permite agrupar entidades con funcionalidades parecidas o relacionadas entre sí, pero esto no implica que los programas no se vuelvan confusos o difíciles de mantener.

<br>

<img height="200" src="https://user-images.githubusercontent.com/53976242/141298526-c2463ca4-5d53-422f-b958-297dbdebf522.png" />


# Lenguaje de programacion manejado para los ejemplos es Dart
<img  height="400" src="https://user-images.githubusercontent.com/53976242/141536684-e3db659b-0929-4f95-958f-cbec8369a60e.png" />



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

```

![image](https://user-images.githubusercontent.com/53976242/141530087-8777ae30-b909-4ca9-99dd-9889fa03667a.png)

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
  ![image](https://user-images.githubusercontent.com/53976242/141530208-20c49cf2-ec6a-465f-8d0f-3d9adc77a08b.png)

  <br><br>
  
  Cada coche extiende la clase abstracta Coche e implementa el método abstracto precioMedioCoche().
<br><br>
Así, cada coche tiene su propia implementación del método precioMedioCoche(), por lo que el método imprimirPrecioMedioCoche() itera el array de coches y solo llama al método precioMedioCoche().
<br><br>
Ahora, si añadimos un nuevo coche, precioMedioCoche() no tendrá que ser modificado. Solo tendremos que añadir el nuevo coche al array, cumpliendo así el principio abierto/cerrado.
<br><br>

# Principio de Substitución de Liskov

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
![image](https://user-images.githubusercontent.com/53976242/141530941-99b7a41d-e8a3-4ebf-a734-de6355ef7675.png)


Esto viola tanto el principio de substitución de Liskov como el de abierto/cerrado. El programa debe conocer cada tipo de Coche y llamar a su método numAsientos() asociado.
<br>
<br>
Así, si añadimos un nuevo coche, el método debe modificarse para aceptarlo.
<br>
<br>

```DART

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
```
![image](https://user-images.githubusercontent.com/53976242/141531003-fa921ea0-8836-4e08-abc8-4e60dc979c25.png)

Para que este método cumpla con el principio, seguiremos estos principios:
<br><br>
-Si la superclase (Coche) tiene un método que acepta un parámetro del tipo de la superclase (Coche), entonces su subclase (Renault) debería aceptar como argumento un tipo de la superclase (Coche) o un tipo de la subclase (Renault).
<br><br>
-Si la superclase devuelve un tipo de ella misma (Coche), entonces su subclase (Renault) debería devolver un tipo de la superclase (Coche) o un tipo de la subclase (Renault).
<br><br>
Si volvemos a implementar el método anterior:

```DART
main() {
  
  Renault renault = Renault();

  List<int> arrayCoches = [renault.numAsientos()];

  imprimirNumeroAsientos(arrayCoches);
}

void imprimirNumeroAsientos(List coches) {
  for (var element in coches) {
    print("El carro  tiene $element asientos");
  }
}


```
Ahora al método no le importa el tipo de la clase, simplemente llama al método numAsientos() de la superclase. Solo sabe que el parámetro es de tipo coche, ya sea Coche o alguna de las subclases.
<br><br>
Para esto, ahora la clase Coche debe definir el nuevo método:
<br><br>

```DART

abstract class Coche {
  int numAsientos();
}
```
Y las subclases deben implementar dicho método:
<br><br>

```DART
class Renault extends Coche {
  @override
  int numAsientos() {
    return 4;
  }
}

```
Como podemos ver, ahora el método imprimirNumAsientos() no necesita saber con qué tipo de coche va a realizar su lógica, simplemente llama al método numAsientos() del tipo Coche, ya que por contrato, una subclase de Coche debe implementar dicho método.

<br><br>

# Principio de segregación de interfaz
<br><br>
Este principio establece que los clientes no deberían verse forzados a depender de interfaces que no usan.
<br><br>
Dicho de otra manera, cuando un cliente depende de una clase que implementa una interfaz cuya funcionalidad este cliente no usa, pero que otros clientes sí usan, este cliente estará siendo afectado por los cambios que fuercen otros clientes en dicha interfaz.
<br><br>
Imaginemos que queremos definir las clases necesarias para albergar algunos tipos de aves. Por ejemplo, tendríamos loros, tucanes y halcones:
<br><br>

```DART
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

```
![image](https://user-images.githubusercontent.com/53976242/141531054-02d0badc-2674-4dd2-8e11-7accec8655b8.png)


Hasta aquí todo bien. Pero ahora imaginemos que queremos añadir a los pingüinos. Estos son aves, pero además tienen la habilidad de nadar. Podríamos hacer esto:

<br><br>
  ```DART
  abstract class IAve {
  void volar();
  void comer();
  void nadar();
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

  @override
  void nadar() {
    return print("");
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

  void nadar() {
    return print("");
  }
}

void main() {
  Loro loro = Loro();
  loro.volar();

  Tucan tucan = Tucan();
  tucan.comer();
}
  ```
  ![image](https://user-images.githubusercontent.com/53976242/141531142-523a8e01-3656-4086-a0f9-bf6997e2e524.png)

  <br>
  El problema es que el loro no nada, y el pingüino no vuela, por lo que tendríamos que añadir una excepción o aviso si se intenta llamar a estos métodos. Además, si quisiéramos añadir otro método a la interfaz IAve, tendríamos que recorrer cada una de las clases que la implementa e ir añadiendo la implementación de dicho método en todas ellas. Esto viola el principio de segregación de interfaz, ya que estas clases (los clientes) no tienen por qué depender de métodos que no usan.
  <br><br>
  Lo más correcto sería segregar más las interfaces, tanto como sea necesario. En este caso podríamos hacer lo siguiente:
  
  <br><br>
  
  ```DART
    abstract class IAve {  
    void comer();
}
abstract class IAveVoladora {  
    void volar();
}

abstract class IAveNadadora {  
    void nadar();
}

class Loro implements IAve, IAveVoladora{

    @override
     void volar() {
        return print("el Loro puede volar");
    }

    @override
     void comer() {
        return print("el Loro puede Comer");
    }
}

class Pinguino implements IAve, IAveNadadora{

    @override
     void nadar() {
         return print("el Pinguino puede Nadar");
    }

    @override
     void comer() {
         return print("el Pinguino puede comer");
    }
}

main(){
  Loro loro = Loro();
  loro.volar();
  
  Pinguino pinguino = Pinguino(); 
  pinguino.nadar();
}
  ````
  ![image](https://user-images.githubusercontent.com/53976242/141525385-10e1c5e3-e3c4-4a93-b7da-9f6221a98694.png)

  Así, cada clase implementa las interfaces de la que realmente necesita implementar sus métodos. A la hora de añadir nuevas funcionalidades, esto nos ahorrará bastante tiempo, y además, cumplimos con el primer principio (Responsabilidad Única).
  <br><br>
  
  # D: Principio de inversión de dependencias
  Establece que las dependencias deben estar en las abstracciones, no en las concreciones. Es decir:
  

-Los módulos de alto nivel no deberían depender de módulos de bajo nivel. Ambos deberían depender de abstracciones.
<br><br>
-Las abstracciones no deberían depender de detalles. Los detalles deberían depender de abstracciones.
<br><br>

En algún momento nuestro programa o aplicación llegará a estar formado por muchos módulos. Cuando esto pase, es cuando debemos usar inyección de dependencias, lo que nos permitirá controlar las funcionalidades desde un sitio concreto en vez de tenerlas esparcidas por todo el programa. Además, este aislamiento nos permitirá realizar testing mucho más fácilmente.
<br><br>

Supongamos que tenemos una clase para realizar el acceso a datos, y lo hacemos a través de una BBDD:
<br><br>
```DART
class DatabaseService{  
    //...
    void getDatos() {}
}

class AccesoADatos {

     DatabaseService  databaseService = DatabaseService();

     AccesoADatos(DatabaseService databaseService){
        this.databaseService = databaseService;
    }

    Dato getDatos(){
        databaseService.getDatos();
        //...
    }
}


class Dato{
}
```
Imaginemos que en el futuro queremos cambiar el servicio de BBDD por un servicio que conecta con una API. Para un minuto a pensar qué habría que hacer... ¿Ves el problema? Tendríamos que ir modificando todas las instancias de la clase AccesoADatos, una por una.
<br><br>
Esto es debido a que nuestro módulo de alto nivel (AccesoADatos) depende de un módulo de más bajo nivel (DatabaseService), violando así el principio de inversión de dependencias. El módulo de alto nivel debería depender de abstracciones.
<br><br>
Para arreglar esto, podemos hacer que el módulo AccesoADatos dependa de una abstracción más genérica:
<br><br>

```DART
abstract class Conexion {  
    Dato getDatos();
    void setDatos();
}

class AccesoADatos {

     Conexion conexion;

     AccesoADatos(Conexion conexion){
        this.conexion = conexion;
    }

     getDatos(){
        conexion.getDatos();
    }
}

class Dato{}
```

Así, sin importar el tipo de conexión que se le pase al módulo AccesoADatos, ni este ni sus instancias tendrán que cambiar, por lo que nos ahorraremos mucho trabajo.
<br><br>
Ahora, cada servicio que queramos pasar a AccesoADatos deberá implementar la interfaz Conexion:
<br><br>


```DART
      
abstract class Conexion {  
    Dato getDatos();
    void setDatos();
}

class DatabaseService implements Conexion {

    @override
     Dato getDatos() { }

    @override
     void setDatos() { }
}

class APIService implements Conexion{

    @override
     Dato getDatos() { }

    @override
     void setDatos() { }
}
      
      


class AccesoADatos {

     Conexion conexion;

     AccesoADatos(Conexion conexion){
        this.conexion = conexion;
    }

     getDatos(){
        conexion.getDatos();
    }
}

class Dato{}
```
<br><br>
Así, tanto el módulo de alto nivel como el de bajo nivel dependen de abstracciones, por lo que cumplimos el principio de inversión de dependencias. Además, esto nos forzará a cumplir el principio de Liskov, ya que los tipos derivados de Conexion (DatabaseService y APIService) son sustituibles por su abstracción (interfaz Conexion).

---
Carlos Macías Martín . (03 April 2019). Principios SOLID. 2021, noviembre 12, de enmilocalfunciona Recuperado de https://enmilocalfunciona.io/principios-solid/
---


