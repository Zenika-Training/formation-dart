# Présentation générale

<!-- .slide: data-background="reveal/theme-zenika/images/title-background.png" -->



## Plan

<!-- .slide: class="toc" -->

- **[Présentation générale](#/1)**
- [Un aperçu du langage](#/2)
- [Première application web](#/3)
- [Communication avec le serveur](#/4)
- [Utilisation des APIs HTML5](#/5)
- [Structurer et tester son code](#/6)
- [Les outils](#/7)
- [Dart côté serveur](#/8)
- [L'avenir de Dart](#/9)



## Dart, un langage ...

- de programmation *web*
- *standardisé* par l'[ECMA 408](http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-408.pdf)
- releasé en Octobre 2011
- développé et soutenu par *Google*

<figure>
  <img src="ressources/images/modern-web.png"/>
</figure>



## Un langage inspiré par d'autres

- Fonctionnant dans une *VM*
- *Orienté objet* avec héritage par classe
- *dynamiquement* typé
- notion de *Future* / *Promise*
- Facile à prendre en main



## Exemple

```Dart
class Training {
  // private variable
  List<Attendee> _attendees;
  // public variable
  String name;

  // constructor
  Training(this._attendees);

  // getter
  List<Attendee> get attendees => _attendees;

  // one line function & string interpolation
  String toString() => "${_attendees.length} attendees";
}
```



## Pourquoi un nouveau langage ?

- JavaScript *non adapté* pour des applications d'envergures
  - *undefined* ou *null*
  - complexité des scopes
  - *this* variable suivant le context
- *Performances limitées* des moteurs d'exécutions
- Un langage *unique* (client & serveur)
- *Compilable* vers JavaScript
  - Même équipe que pour le compilateur GWT



## Plus qu'un langage, un écosystème

- Un gestionnaire de paquet : *pub*
- Un *IDE* dédié Dart Editor
- Des plugins pour les éditeurs les plus répandus
  - Sublime Text
  - WebStorm
- Un navigateur avec la VM intégré : *Dartium*
- Un compilateur : *dart2js*



<!-- .slide: data-background="reveal/theme-zenika/images/questions.png" -->
<!-- .slide: data-background-size="30%" -->
