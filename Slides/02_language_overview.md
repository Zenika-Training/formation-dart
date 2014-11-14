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



<!-- .slide: data-background="reveal/theme-zenika/images/questions.png" -->
<!-- .slide: data-background-size="30%" -->
