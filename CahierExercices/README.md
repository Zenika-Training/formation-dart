# Cahier de TP

## Génération du PDF

Pour générer le PDF, il faut avoir Node.js. 
Lancer `npm install` dans le répertoire puis `grunt`.

## CSS

Le CSS utilisé se trouve dans `resources/github.css`. Comme son nom l'indique
il est très largement inspiré de la mise en page de GitHub.

Il lui manque néanmoins quelques règles d'impression notamment pour que les
grand titres ne se retrouvent pas en bas de page.

## Assets

Mettre des assets est possible mais le chemin pour les lier est peu pratique.

Voici un exemple d'image :

```markdown
![Node.js](../../../resources/logo-zenika.jpg)
```

Sauf en modifiant la librairie utiliser pour générer le PDF, il n'est pas
possible d'utiliser un chemin plus intuitif.
