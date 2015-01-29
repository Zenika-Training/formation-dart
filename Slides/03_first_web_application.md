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

```
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>first_web_application</title>
</head>

<body>
  <script type="application/dart" src="main.dart"></script>
  <script data-pub-inline src="packages/browser/dart.js"></script>
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



<!-- .slide: data-background="reveal/theme-zenika/images/questions.png" -->
<!-- .slide: data-background-size="30%" -->
