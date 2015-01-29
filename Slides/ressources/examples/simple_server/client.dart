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