import 'package:egitimSistemi/pages/register.dart';
import 'package:egitimSistemi/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'ApplicationHomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Login(),
    debugShowCheckedModeBanner: false,
  ));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthService _authService = AuthService();
  String _hata = "hata";
  void register() {
    //FirebaseAuth.instance
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white60,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(' Öğrenci Girişi'),
      ),
      body: SafeArea(
        //child: form(),
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backgraundImage.png'),
                fit: BoxFit.cover),
          ),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
                color: Color.fromRGBO(0, 0, 0, 0.7),
                height: 400,
                width: 300,
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('assets/images/40.png'),
                          ),
                        ),
                        TextFormField(
                          controller: _emailController,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Colors.white,
                            ),
                            hintText: 'E-Mail',
                            prefixText: ' ',
                            hintStyle: TextStyle(color: Colors.white),
                            focusColor: Colors.white,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          cursorColor: Colors.white,
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: Colors.white,
                            ),
                            hintText: 'Parola',
                            prefixText: ' ',
                            hintStyle: TextStyle(color: Colors.white),
                            focusColor: Colors.white,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        ButtonBar(
                          children: <Widget>[
                            _registerButton(),
                            _loginButton(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton() => RaisedButton(
        child: Text(
          'Giriş Yap',
          style: TextStyle(fontSize: 25.0),
        ),
        color: Colors.green,
        highlightColor: Colors.blue,
        onPressed: () {
          try {
            build(context) => _authService.veriGetir("Lesson_1");
            _authService
                .signIn(_emailController.text, _passwordController.text)
                .then(
              (value) {
                return Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ApplicationHomePage()));
              },
            ).catchError(
              (onError) {
                if (onError.toString() ==
                    "[firebase_auth/unknown] Given String is empty or null") {
                  _hata = "Tüm Alanları Doldurduğunuzdan Emin Olun";
                } else if (onError.toString() ==
                    "[firebase_auth/wrong-password] The password is invalid or the user does not have a password.") {
                  _hata = "Yanlış veya Geçersiz Şifre";
                } else if (onError.toString() ==
                    "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.") {
                  _hata = "Girilen Mail Adresi Yanış! ";
                } else if (onError.toString() ==
                    "[firebase_auth/invalid-email] The email address is badly formatted.") {
                  _hata = "Mail Adresi Uygun Formatta Değil !";
                } else if (onError.toString() ==
                    "[firebase_auth/too-many-requests] We have blocked all requests from this device due to unusual activity. Try again later.") {
                  _hata =
                      "Kısa Zamanda çok Fazla giriş isteginde bulundunuz. Daha Sonra Tekrar Deneyin";
                } else {
                  _hata = "Beklenmedik Bir Hata Olustu";
                }
                Alert(
                  type: AlertType.warning,
                  context: context,
                  title: _hata,
                  buttons: [
                    DialogButton(
                      child: Text(
                        "KAPAT",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ).show();
              },
            );
          } catch (e) {
            Alert(
              type: AlertType.warning,
              context: context,
              title: "Beklenmeyen Bir Hata Olustu",
              buttons: [
                DialogButton(
                  child: Text(
                    "KAPAT",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ).show();
          }
        },
      );

  Widget _registerButton() => RaisedButton(
        child: Text(
          '   Kaydol   ',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        highlightColor: Colors.blue,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UserRegisterPage()));
        },
      );
}
