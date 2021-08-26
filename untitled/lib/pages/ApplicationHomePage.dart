import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ApplicationHomePage extends StatefulWidget {
  @override
  _ApplicationHomePageState createState() => _ApplicationHomePageState();
}

class _ApplicationHomePageState extends State<ApplicationHomePage> {
  final TextEditingController textController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  final _button2 = GlobalKey();

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '8eFRMfZM50g',
    params: YoutubePlayerParams(
      //playlist: ['nPt8bK2gbaU', 'gQDByCdjUXw'], // Defining custom playlist
      startAt: Duration(seconds: 0),

      showControls: true,
      showFullscreenButton: true,
      privacyEnhanced: true,
      useHybridComposition: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    String lastLesson = "Lesson_1";
    var lessons = [];
    for (int i = 0; i < 20; i++) {
      lessons.add("Lesson_" + (i + 1).toString());
    }

    String nextLessonGet(String lastLesson) {
      String nextLesson = "";
      for (int i = 0; i < lessons.length; i++) {
        if (lessons[i] == lastLesson) {
          if (i < 19) {
            nextLesson = lessons[i + 1];
          } else
            nextLesson = lessons[i];
        }
      }

      return nextLesson;
    }

    //Veri çekmek için kullanılıyor
    adresAl(String ders) {
      CollectionReference lessonRef =
          FirebaseFirestore.instance.collection("Lessons");
      var textRef = lessonRef.doc(ders).collection(ders).doc(ders);
      return textRef;
    }

    //butonların onpress özelliği için kullanılıyor
    void buttonClick(String lesson) async {
      lastLesson = lesson;
      var response = await adresAl(lesson).get();
      var data = response.data();
      String text = data!['Text'];
      String title = response.data()!["Title"];
      String url = response.data()!["Video_Link"];
      titleController.text = title;
      textController.text = text;
      _controller.load(url, startAt: Duration(seconds: 0));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white60,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Uygulama Anasayfa'),
      ),
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backgraundImage.png'),
                fit: BoxFit.cover),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
            color: Color.fromRGBO(255, 255, 255, 0.5),
            height: 400,
            width: 300,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                Column(
                  children: <Widget>[
                    YoutubePlayerControllerProvider(
                      // Provides controller to all the widget below it.
                      controller: _controller,

                      child: YoutubePlayerIFrame(
                        aspectRatio: 16 / 9,
                      ),
                    ),
                    Divider(
                      height: 4.0,
                      color: Colors.blueGrey,
                    ),
                    TextField(
                      controller: titleController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      enabled: false,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                    ),
                    Divider(
                      height: 4.0,
                      color: Colors.blueGrey,
                    ),
                    TextField(
                      controller: textController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      enabled: false,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                    ),
                    Divider(
                      height: 4.0,
                      color: Colors.blueGrey,
                    ),
                    ElevatedButton(
                      child: Text(
                        '   Sonraki Ders  ',
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.blue;
                            return Colors.white; // Use the component's default.
                          },
                        ),
                      ),
                      onPressed: () {
                        buttonClick(nextLessonGet(lastLesson));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                child: Image.asset("assets/images/myLife.jpg"),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.account_circle_outlined),
                      title: Text("Profilim"),
                      onTap: () {
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ogrenciProfil(),
                          ),
                        );*/
                      },
                    ),
                    Divider(
                      height: 4.0,
                      color: Colors.blueGrey,
                    ),
                    ExpansionTile(
                      title: Text("Derse Başla"),
                      leading: Icon(Icons.receipt_long_outlined),
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            leading: Icon(Icons.east_outlined),
                            title: Text("1.Ders"),
                            onTap: () async {
                              buttonClick("Lesson_1");
                            },
                          ),
                        ),
                        Container(
                          key: _button2,
                          margin: EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            leading: Icon(Icons.east_outlined),
                            title: Text("2.Ders"),
                            onTap: () {
                              buttonClick("Lesson_2");
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            leading: Icon(Icons.east_outlined),
                            title: Text("3.Ders"),
                            onTap: () {
                              buttonClick("Lesson_3");
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            leading: Icon(Icons.east_outlined),
                            title: Text("4.Ders"),
                            onTap: () async {
                              buttonClick("Lesson_4");
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            leading: Icon(Icons.east_outlined),
                            title: Text("5.Ders"),
                            onTap: () {
                              buttonClick("Lesson_5");
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            leading: Icon(Icons.east_outlined),
                            title: Text("6.Ders"),
                            onTap: () {
                              buttonClick("Lesson_6");
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            leading: Icon(Icons.east_outlined),
                            title: Text("7.Ders"),
                            onTap: () {
                              buttonClick("Lesson_7");
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            leading: Icon(Icons.east_outlined),
                            title: Text("8.Ders"),
                            onTap: () {
                              buttonClick("Lesson_8");
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            leading: Icon(Icons.east_outlined),
                            title: Text("9.Ders"),
                            onTap: () {
                              buttonClick("Lesson_9");
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            leading: Icon(Icons.east_outlined),
                            title: Text("10.Ders"),
                            onTap: () {
                              buttonClick("Lesson_10");
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            leading: Icon(Icons.east_outlined),
                            title: Text("11.Ders"),
                            onTap: () {
                              buttonClick("Lesson_11");
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            leading: Icon(Icons.east_outlined),
                            title: Text("12.Ders"),
                            onTap: () {
                              buttonClick("Lesson_12");
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            leading: Icon(Icons.east_outlined),
                            title: Text("13.Ders"),
                            onTap: () {
                              buttonClick("Lesson_13");
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            leading: Icon(Icons.east_outlined),
                            title: Text("14.Ders"),
                            onTap: () {
                              buttonClick("Lesson_14");
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            leading: Icon(Icons.east_outlined),
                            title: Text("15.Ders"),
                            onTap: () {
                              buttonClick("Lesson_15");
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            leading: Icon(Icons.east_outlined),
                            title: Text("16.Ders"),
                            onTap: () {
                              buttonClick("Lesson_16");
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            leading: Icon(Icons.east_outlined),
                            title: Text("17.Ders"),
                            onTap: () {
                              buttonClick("Lesson_17");
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            leading: Icon(Icons.east_outlined),
                            title: Text("18.Ders"),
                            onTap: () {
                              buttonClick("Lesson_18");
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            leading: Icon(Icons.east_outlined),
                            title: Text("19.Ders"),
                            onTap: () {
                              buttonClick("Lesson_19");
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            leading: Icon(Icons.east_outlined),
                            title: Text("20.Ders"),
                            onTap: () {
                              buttonClick("Lesson_20");
                            },
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 4.0,
                      color: Colors.blueGrey,
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.blueGrey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
