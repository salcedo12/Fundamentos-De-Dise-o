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
