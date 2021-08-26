import 'package:egitimSistemi/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lesson1 extends StatefulWidget {
  @override
  _Lesson1State createState() => _Lesson1State();
}

class _Lesson1State extends State<Lesson1> {
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white60,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Kaydol'),
      ),
      body: SafeArea(
        //child: form(),
        //_authService.getLessons("Lesson_2");
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backgraundImage.png'),
                fit: BoxFit.cover),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
            color: Color.fromRGBO(0, 0, 0, 0.7),
            height: 400,
            width: 300,
            /*   child: Column(
              children: <Widget>[
                Container (
                  child: Text(
                     ",", // Zorunlu adlandırılmamış strin parametre
                      style:
                          TextStyle(), // metnin rengimi, boyutunu, kalınlıgını, gölgesi gibi daha bir çok özelliği belirler
                      textAlign: TextAlign
                          .center, // Metnin yatayda nasıl hizalanması gerektiğini belirtir. Örnekte yatayda mmerkezde hizalanır.
                      textDirection: TextDirection
                          .ltr, //metnin yazım yönü. örnekte yazı soldan sağa doğru yazılacak
                      softWrap:
                          true //false olursa sonsuz satır gibi davranır true olursa parent oğenin sınıralarına ve overflow tipine tabi olur.
                      //overFlow:TextOverflow.clip , // taşma durumunda nasıl kırpılsın . Örnekte parent widget sınırına yani satır sonuna gelince kırpılsın ve alta atılsın.
                      ),
                ),
              ],
            ),*/
          ),
        ),
      ),
    );
  }
}
