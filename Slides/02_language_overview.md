# Un aperçu du langage

<!-- .slide: data-background="reveal/theme-zenika/images/title-background.png" -->



## Plan

<!-- .slide: class="toc" -->

- [Présentation générale](#/1)
- **[Un aperçu du langage](#/2)**
- [Première application web](#/3)
- [Communication avec le serveur](#/4)
- [Utilisation des APIs HTML5](#/5)
- [Structurer et tester son code](#/6)
- [Les outils](#/7)
- [Dart côté serveur](#/8)
- [L'avenir de Dart](#/9)



## Un premier programme

```Dart
void main() {
  print('Hello Dart Training');

  var firstList = []; // A dynamically typed list
  firstList..add(1)
           ..add('foo');

  print(firstList);
}

```
- Tout programme démarre avec l'exécution de *main*
- Déclaration aisée : *[ ]* - liste, *{ }* - map
- Method cascades *..*
  - Inspiré des directory *UNIX*



## Dynamiquement typé mais statiquement analysable (1/2)

```Dart
void main() {
  var first = 1;
  print(first);

  first = 'foo'; // ???
  print(first);

  String second = 'bar';
  print(second);

  second = 2; // ???
  print(second);
}
```



## Dynamiquement typé mais statiquement analysable (2/2)

- Analysé *statiquement* par les éditeurs
  - Auto-complétion
  - Détection d'erreurs
- Deux runtimes :
  - *Checked* pour le *développement*
  - *Unchecked* pour la *production*



## Une classe Java
```Java
public class Car {

  private int price;
  private String type;
  private String brand;

  public Car(type, brand, price) {
    this.type = type;
    this.brand = brand;
    this.price = price;
  }

  public int getPrice() {
    return price;
  }

  /* ... */
}
```



## Une classe Java
```Java
public class Car {

  /* ... */

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public String getBrand() {
    return brand;
  }

  public void setBrand(String brand) {
    this.brand = brand;
  }

}
```



## Une classe Dart

```Dart
library car;

class Car {

  int _price;
  String type;
  String brand;

  Car(this.type, this.brand, this.price);

  int get price => _price;

}
```



## Variables

- Dart inclut 6 types de bases :
  - *num* : *int*, *double*
  - *String*
  - *bool*
  - *Map* déclaré via {}
  - *List* déclaré via []
  - *Date*
- *final* déclare une variable ne pouvant être affectée qu'*une* seule fois
- *const* déclare une constante dont la *déclaration et l'affectation* sont réalisées simultanément



## Getter et setter

Les getters et setters sont inclus nativement dans Dart et s'utilisent comme les variables (lecture et affectation).

```Dart
class Training {

  Trainer _trainer;

  bool get busy => _trainer.busy;

  void set busy(bool busy) {
    _trainer.busy = busy;
  }
}

// Utilisation avec un training existant
training.busy = true;

print(training.busy);
```



## Fonctions

- Les fonctions sont des *citoyens de premier ordre*
  - Exemple : la fonction *main* n'est pas encapsulé dans une classe
- Possibilité de passer des fonctions en paramètre

```Dart
reduce(array, callback) {
  callback(array);
}
```
- Une fonction est *nommée* ou *anonyme*



## Fonctions : Paramètres optionnels

Il est possible de définir des paramètres optionnels :

- *positionnels*
- *nommés*

Exemple : 

```Dart
positional([first="Default Value", second]) {
  print("$first ${second != null ? second : ''}");
}

named({first: "Default Value", second}) {
  print("$first ${second != null ? second : ''}");
}

main() {
  positional('Hello', 'World');
  named(first: 'Hello', second: 'World');
}
```



## Librairies

- Librairie
  - Proche des *packages* en Java
  - groupement *logique* de classes & fonctions
- Une librairie peut-être :
  - un unique fichier
  - scindée entre plusieurs fichiers
- Directive d'*import* pour les autres librairies



## Librairies

Déclaration d'une librairie scindée

```Dart
// Déclaration
library mon_application;

import 'dart:io';

part "mon_application_1.dart";
part "mon_application_2.dart";
```

Implémentation dans un fichier

```Dart
// Fichier mon_application_1.dart
part of mon_application;
```



## Héritage et interfaces

- Héritage
  - via *extends*
  - héritage *simple*
- Interface *implicite*, chaque classe exporte une interface contenant les membres :
  - de la classe
  - des interfaces implémentées
- Une classe peut implémenter plusieurs interfaces



## Interface implicite

Exemple :
```Dart
class Person {

  void greet() => "Hello there!";

}

class Pal implements Person {

  void greet() => "Hi Pal!";

}

Person p = new Pal();
print(p.greet());
```

```
Hi Pal!
```



## Mixins

Les *mixins* permettent de réaliser de l'héritage multiple.



<!-- .slide: data-background="reveal/theme-zenika/images/questions.png" -->
<!-- .slide: data-background-size="30%" -->
