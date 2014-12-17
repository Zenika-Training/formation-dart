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

Notes :
- Unchecked mode : 1 foo bar 3
- Checked mode : 1 foo bar
Breaking on exception: object of type _TypeError: type 'int' is not a subtype of type 'String' of 'second'.




## Dynamiquement typé mais statiquement analysable (2/2)

- Analysé *statiquement* par les éditeurs
  - Auto-complétion
  - Détection d'erreurs
- Deux runtimes :
  - *Checked* pour le *développement*
  - *Unchecked* pour la *production*



  
## Gestion des numériques (1/2)

```Dart
var pi = 3.14159;
double astronomicalUnitInMiles = 92,955,807.273;
var result = 6.72e9; // 6720000000.0
```
- Les doubles sont des nombres flottants encodés en 64 bit. 
- IEEE-754 standard.
- Tout nombre avec une décimale est considéré comme un double.
- Possibilité d'utiliser la notation scientifique.



## Gestion des numériques (2/2)

```Dart
var result = 22 + 11;  // 33
var formulaAnswer = (8 * 2) / 4 + 2 - 1;  // 5.0
var division = 5 / 2; // 2.5
var truncatingDivision = 5 ~/ 2; // 2
```
- Les entiers et les doubles sont des sous-classes de ['num'](https://api.dartlang.org/apidocs/channels/stable/dartdoc-viewer/dart:core.num).
- Les opérateurs `+ - * /` sont des méthodes de la classe ['num'](https://api.dartlang.org/apidocs/channels/stable/dartdoc-viewer/dart:core.num).
- Différence entre la division et la division tronquée avec `~/`
- Il existe d'autres méthodes très pratique à appeler sur un nombre.
```Dart
42.2.ceil(); // 43.0
42.2.floor(); // 42.0
42.7.round(); // 43.0
(-42).abs(); // 42
```



## Conversion 

```Dart
int.parse('1'); // 1
int.parse('0x42'); // 66
int.parse('42', radix: 16); // 66
double.parse('1.1'); // 1.1

assert(num.parse('42') is int);
assert(num.parse('0x42') is int);
assert(num.parse('0.50') is double);

42.toString(); // '42'
// Specify the number of digits after the decimal.
assert(123.456.toStringAsFixed(2) == '123.46');
```
- La méthode `parse` essaie de créer si possible un integer, sinon un double.
- `toStringAsFixed`, `toStringAsPrecision`, `toStringAsExponential` sont d'autres méthodes de 'num'.

Notes :
- `int.parse('1.1')` lance l'erreur 'FormatException: Invalid radix-10 number'
- Attention aux gros nombres : cela peut poser en javascript
- ```
print(double.NAN); //Nan
print(double.INFINITY); //-Infinity
print(double.NEGATIVE_INFINITY); //-Infinity
```



## Gestion des chaînes de caractères (1/3)

```Dart
var message = "Bob's puppy is really cute.";
String html = '<button id="confirmation">Confirm?</button>';
var username = 'Alice';
var message = 'Hello, $username!'; // Hello, Alice!
```
- Les chaînes de caractères sont une suite de caractères UTF-16
- 'String interpolation' avec le symbole `$`
- Pas de concaténation avec `+`

Notes :
- `StringBuffer` permet de s'occuper de la concaténation



## Gestion des chaînes de caractères (2/3)

```Dart
var longMessage = 'This is a long message '
                                'that is split over two lines';
// == This is a long message that is split over two lines.

var evenLongerMessage = 
'''
You can create
multi-line strings like this one.
This is great for templates or snippets of html.''';

var raw = r"Raw strings \n are $left as is." 
// == Raw strings \n are $left as is.
```
- Triple simples quotes ou triple double quotes fonctionnent :)
- Utiliser les 'raw strings' pour désactiver les 'interpolations'
 - pratique pour les caractères spéciaux,
 - nécessaire pour les regex.

Notes :
- La classe `RegExp` utilisent les mêmes patterns Javascript




## Gestion des chaînes de caractères (3/3)

```Dart
// Check whether a string contains another string.
assert('Never odd or even'.contains('odd'));

// Does a string start with another string?
assert('Never odd or even'.startsWith('Never'));

// Grab a substring.
assert('Never odd or even'.substring(6, 9) == 'odd');

// Find the location of a string inside a string.
assert('Never odd or even'.indexOf('odd') == 6);

// Convert to uppercase.
assert('zenika'.toUpperCase() == 'ZENIKA');

// Get all the UTF-16 code units in the string.
var codeUnitList = 'Never odd or even'.codeUnits.toList();
```
- Autres méthodes : `trim`, `replaceAll`, `isEmpty`, `endsWith`



## Gestion des booléens

```Dart
int lineCount;
assert(lineCount == null);
// Variables (even if they will be numbers) are initially null.

var dartIsFun = true;
bool dartIsHardToLearn = false;

if (1) {
  // in JavaScript, this is true
} else {
  // in Dart, this is false
}
```
- *Only true is truthy*
- Pas de *undefined*, seulement *null*



## Gestion des collections

```Dart
var numbers = new Iterable.generate(5, (i) => i);
// 0 1 2 3 4
for (var number in numbers) {
  print(number);
}
numbers.length;
numbers.any((int i) => i.isEven);
numbers.contains(10);
numbers.where((i) => i.isOdd).toSet();
// 1, 3
numbers.map((i) => i * 2).toList();
// 0, 2, 4, 6, 8
[0, 1, 2, 3].where((n) => n.isEven).forEach(print);
```
- Gestion des *List*, *Set*, *Map*, *Queue*
- Pas de `array`

Notes :
Image à montrer si pas clair l'utilisation de chaque type :
https://www.dartlang.org/dart-tips/imgs/ep-5-flowchart.png



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

Notes :
- constructeur nommé
- private avec *_*



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



## Fonctions (1/2)

- Les fonctions sont des *citoyens de premier ordre*
  - Exemple : la fonction *main* n'est pas encapsulée dans une classe
- Possibilité de passer des fonctions en paramètre

```Dart
reduce(array, callback) {
  callback(array);
}
```
- Une fonction est *nommée* ou *anonyme*



## Fonctions (2/2)

```Dart
// A éviter
filterAndPrint(List items, Function filter) {
  items.where(filter).forEach(print);
}
// Préconiser
filterAndPrint(List items, bool filter(int n)) {
  items.where(filter).forEach(print);
}

filterAndPrint([8,9,10], (n) => n.isEven);
// 8, 10
```



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
