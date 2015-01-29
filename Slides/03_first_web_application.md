# Une première application web

<!-- .slide: data-background="reveal/theme-zenika/images/title-background.png" -->



## Plan

<!-- .slide: class="toc" -->

- [Présentation générale](#/1)
- [Un aperçu du langage](#/2)
- **[Première application web](#/3)**
- [Communication avec le serveur](#/4)
- [Utilisation des APIs HTML5](#/5)
- [Structurer et tester son code](#/6)
- [Les outils](#/7)
- [Dart côté serveur](#/8)
- [L'avenir de Dart](#/9)



## Une première application web (1 / 2)

Un template :

```html
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>first_web_application</title>
</head>

<body>
  <script type="application/dart" src="main.dart"></ script>
  <script src="packages/browser/dart.js"></ script>
</body>
</html>
```



## Une première application web (2 / 2)

Un script importé depuis le template :

```Dart
import 'dart:html';

void main() {
  document.querySelector('body').innerHtml = 'Hello Dartisans!';
}
```

La déclaration des dépendances nécessaires :
```Yaml
name: first_web_application
version: 0.0.1
description: A first web application
environment:
  sdk: '>=1.0.0 <2.0.0'
dependencies:
  browser: any

```



## Une application web actuelle (1 / 2)

Un environnement de développement :

* Grunt / Gulp : task runner
  * Tâches courrantes :
    * Validation du code
    * Concaténation
    * Minification
* Gestionnaire de dépendances : bower / jspm / npm
* JSHint : validation de code

=> nécessite `Node.js` ou `io.js`



## Une application web actuelle (2 / 2)

Le développement nécessite aussi des librairies diverses :

* jQuery : manipulation du DOM
* Lodash / Underscore : manipulation des données
* MomentJS : manipulation des dates
* Modernizr : détection des capacités des navigateurs
* PrototypeJS : polyfills pour anciens navigateurs
* Un framework MVC : pour développer la webapp

Dart permet de limiter `drastiquement` le nombre de librairies nécessaires.



## Dart : un écosystème complet

Dart fournit nativement :

* Un gestionnaire de dépendances : `pub`
* Une `analyse statique` de code intégré dans les éditeurs
* Une `compilation` vers du JavaScript (minification + concaténation)
* Un ensemble de librairies natives limitant l'inclusion de librairies externes



## Dart : comparaison avec jQuery

Sélection d'un élement avec altération du style :

jQuery
```JavaScript
$('#foo')
    .addClass('test')
    .removeClass('bar');
```

Dart
```Dart
document.querySelector('#foo')
.classes
  ..add('test')
  ..remove('bar');
```

Dart différencie la sélection `simple` de la sélection `multiple` :

```
document.querySelector vs document.querySelectorAll
```



## Dart : Filtrer une collection

Avec Lodash:
```javascript
_.filter(['foo', 'test', 'france', 'Zenika'], function(s) {
  return s.toLowerCase()[0] === 'z';
});
```

Avec Dart
```java
['foo', 'test', 'france', 'Zenika'].
  where((String s) => s[0].toLowerCase() == 'z');
```

Dart possède un ensemble de méthodes :

`forEach`, `where`, `reduce`, `map`, `removeWhere`, `firstWhere` ...



## Dart et les librairies

* `Modernizr` / `Prototype` : gestion de la compatibilité avec les navigateurs intégrée
* `MomentJS` : gestion des dates via une API utilisable nativement
* Framework `MVC` - Dart ne fournit rien dans ce sens mais il existe des solutions alternatives :
  * `AngularDart`
  * ForceMVC



## La récupération des éléments du DOM

Il existe deux sélecteurs distincts pour trouver :

* Un élément
* Plusieurs éléments

```dart
// Getting one element
// Trouve le premier tag H1 de l'écran
document.querySelector('h1');
// Trouve l'élément d'ID znk
var myElement = document.querySelector('#znk');
// Trouve le premier "panel" de myElement
myElement.querySelector('.panel');

// Getting multiple elements
// Trouve tous les h1 de myElement
myElement.querySelectorAll('h1');
// Trouve tous les panels du document
document.querySelectorAll('.panel');
```



## Création de nouveaux éléments

Utilisation du constructeur dédié :

```dart
var myDiv = new DivElement();
myDiv.innerHtml = '<p>Hello world!</p>';

```

Utilisation du parsing :
```dart
var anotherDiv = new Element.html("""
  <div id="bar">
    <ul>
      <li>First</li>
      <li>Second</li>
    </ul>
  </div>
""");
```



## Insertion des éléments (1 / 3)

Il existe plusieurs moyens pour ajouter des éléments au DOM :

* Node `append`(Node newChild) - ajoute l'élément comme dernier enfant du parent
* Node `insertAllBefore`(Iterable<Node> newNodes, Node refChild) - insère la liste de nœuds avant refChild
* Node `insertBefore`(Node newNode, Node refChild) - insère  newNode avant refChild
* Element `insertAdjacentElement`(String where, Element element) - insère element à la position spécifiée par where
  * `beforeBegin` (`afterEnd`) avant (après) l'élément appelant
  * `afterBegin` (`beforeEnd`) comme premier (dernier) enfant de l'élément appelant



## Insertion des éléments (2 / 3)

Suivant le DOM :
```html
<body>
  <div id="content">
  </div>
</body>
```

On peut ajouter les éléments:
```dart
document.querySelector('#content')
  ..append(new Element.html('<div id="foo">I\'m foo!</div>'))
  ..insertAdjacentElement('afterBegin',
    new Element.html('<div id="bar">I\'m bar!</div>')
  )
  ..insertAdjacentElement('beforeBegin',
    new Element.html('<h1>Hello Dartisans!</h1>')
  );
```



## Insertion des éléments (3 / 3)

Résultat

```
<h1>Hello Dartisans!</h1>
<div id="content">
  <div id="bar">I'm bar!</div>

  <div id="foo">I'm foo!</div>
</div>
```



## Suppression d'éléments

La suppression est simplifiée par rapport à JavaScript

```JavaScript
// JavaScript
var content = document.querySelector("#content");
content.parentNode.removeChild(content);
```

Dart simplifie en évitant l'indirection par le nœud parent :

```Dart
// Dart
document.querySelector("#content").remove();
```



## Mise à jour d'élément

Il est possible d'ajouter et de modifier les classes CSS à la jQuery :

```JavaScript
$("#content")
  .addClass("foo")
  .removeClass("bar");
```

Dart propose aussi un équivalent permettant d'ajouter de faire des actions multiples. C'est la conjonction de l'API `classes` et des `method cascades`:
```Dart
document.querySelector("#content").classes
  ..add("foo")
  ..remove("bar");
```



## DOMContentLoaded

Il n'est pas nécessaire d'exécuter du code dans un bloc jQuery.ready :

```JavaScript
$(document).ready(function() {
  // Do something
});
```

L'équivalent en Dart est simplement :

```Dart
main() {
  // Do something
}
```

Le lancement de l'évènement `DOMContentLoaded` déclenche l'exécution de `main`, i.e. notre code s'exécute lorsque le DOM est prêt.

Attention, un `unique` fichier .dart peut-être inclus dans la page HTML. Celui-ci contient la fonction `main` et peut importer d'autres libraries.



<!-- .slide: data-background="reveal/theme-zenika/images/questions.png" -->
<!-- .slide: data-background-size="30%" -->
