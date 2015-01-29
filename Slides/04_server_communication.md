# Communication avec les serveurs

<!-- .slide: data-background="reveal/theme-zenika/images/title-background.png" -->



## Plan

<!-- .slide: class="toc" -->

- [Présentation générale](#/1)
- [Un aperçu du langage](#/2)
- [Première application web](#/3)
- **[Communication avec le serveur](#/4)**
- [Utilisation des APIs HTML5](#/5)
- [Structurer et tester son code](#/6)
- [Les outils](#/7)
- [Dart côté serveur](#/8)
- [L'avenir de Dart](#/9)



## Première étape un premier serveur

Avant de pouvoir communiquer avec le serveur, il faut en faire un :

```
import 'dart:io';

void main() {
  // Let us bind on localhost and port 8000
  HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 1234)
  .then((HttpServer server) {
    server.listen((HttpRequest request) {
      // Let's provide a handler which prints the method and the URI
      print('Request ${request.method} on ${request.uri}');
      // and returns the standard Hello World!
      request.response
        ..write("Hello world!")
        ..close();
    });
  }).catchError((e) => print(e.toString()));
}
```



## Le requêtage côté serveur

Dart propose un client permettant de requêter le serveur depuis une application console :

```
import 'dart:io';
import 'dart:convert';

main() {
  new HttpClient()
  .get(InternetAddress.LOOPBACK_IP_V4.address, 1234, 'test')
  .then((HttpClientRequest hcr) {
    hcr.close(); // Let's fires the request with close
  })
  .then((HttpClientResponse hcr) {
    // The response is not receivable yet since it is a stream
    hcr.transform(UTF8.decoder).listen((contents) {
      // Stream transformation & print the result
      print(contents);
    });
  });
}
```



## Le requêtage côté client (1 / 3)

Depuis le côté client le requêtage peut être simplifié :

```Dart
HttpRequest.getString('http://localhost:1234/').then((String s) {
 document.querySelector('body').text = s;
})
.catchError((e) => print(e));
```

<br />
Mais la version complète est très proche de la version originel de JavaScript:

```Dart
var request = new HttpRequest();
request.open('GET', 'http://localhost:1234/');
request.onLoad.listen((event) {
 document.querySelector('body').text = event.target.responseText;
});
request.send();
```



## Requêtage côté client (2 / 3)

Il faut noter que `XMLHttpRequest` est devenu `HttpRequest` car le XML est très peu
utilisé pour exposer les données des APIs web.


<br /> <!-- ugly I know ;) -->
Cependant Dart fournit la méthode `HttpRequest.request` pour éviter une syntaxe trop verbeuse :

```Dart
HttpRequest.request("http://localhost:1234/putWithRequest",
  method: "PUT",
  requestHeaders: {"Content-Type": "application/json"},
  sendData: JSON.encode({"hello": "world"})
)
.then((HttpRequest response) => print(response.responseText));
```

Avec `HttpRequest.request` rare sont les cas, où il est `nécessaire` d'utiliser la syntaxe
complète pour l'`HttpRequest`.



## Requêtage côté client (3 / 3)

Si l'envoi est de type formData un helper est fourni :

```Dart
HttpRequest.postFormData(
  'http://localhost:1234/trainer',
  {'name': 'Zenika'}
);
```

Dans ce cas les données sont transmises avec le type de contenu `application/x-www-form-urlencoded`.

<br />
Si les requêtes sont `cross-origin` et sont utilisées sous IE9 il faut
utiliser en lieu et place de `request`:
```
HttpRequest.requestCrossOrigin(...);
```




<!-- .slide: data-background="reveal/theme-zenika/images/questions.png" -->
<!-- .slide: data-background-size="30%" -->
