import 'dart:convert';
import 'package:cryptography/dart.dart';
import 'package:cryptography/cryptography.dart';

const List<int> kKey = [68, 218, 11, 30, 77, 92, 100, 173, 254, 169, 137, 183, 203, 189, 79, 39, 69, 103, 205, 208, 68, 49, 125, 232, 8, 172, 44, 140, 217, 26, 237, 259];

class AA{
  
  final algorithm = DartAesCtr(macAlgorithm: Hmac.sha256());
  
  Future<String> create(String url)async{

      final SecretKey secretKey = SecretKey(kKey);

      final SecretBox secretBox = await algorithm.encryptString(url,secretKey: secretKey,);
      
      Map<String,dynamic> map = {
        'cipherText':secretBox.cipherText,
        'nonce':secretBox.nonce,
        'mac':secretBox.mac.bytes,
      };


      String d = json.encode(map);

      print('----< Created >-----$d');
      return d;

     }

  Future<String> read(String data)async{
    SecretKey secretKey = SecretKey(kKey);


     final Map<String,dynamic> map = json.decode(data);


     final cipherText = List<int>.from(map['cipherText']);
     final nonce = List<int>.from(map['nonce']);
     final mac = Mac(List<int>.from(map['mac']));

      
      SecretBox box = SecretBox(cipherText, nonce: nonce , mac:  mac);

     final String clearText = await algorithm.decryptString(box,secretKey: secretKey,);
     print('dfsdf: $clearText'); 
     
     return clearText;

     }

}
