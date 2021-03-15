import 'package:flutter/material.dart';
import 'package:flutter_design/widgets/help_project.dart';
import 'package:flutter_design/widgets/image_select.dart';
import 'package:flutter_design/widgets/namaz_time.dart';
import 'package:flutter_design/widgets/second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash());
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            theme:
                new ThemeData(scaffoldBackgroundColor: const Color(0xFFE5E5E5)),
            home: Home(),
          );
        }
      },
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(image: AssetImage('assets/images/namaz.png')),
      ),
    );
  }
}

class Home extends StatelessWidget {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(image: AssetImage('assets/icons/location.png')),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "АЛМАТЫ",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Главная",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(color: Colors.black, fontSize: 34),
                    ),
                    IconButton(
                        alignment: Alignment.centerRight,
                        icon: Image.asset('assets/icons/menu.png'),
                        onPressed: () {}),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        print("Container clicked");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()),
                        );
                      },
                      child: Ink(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/illustration.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            Text("До Магриба"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "03:12:50",
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                      fontSize: 40, color: Colors.black),
                                ),
                                IconButton(
                                    icon: Icon(Icons.notifications),
                                    onPressed: () {})
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    elevation: 5),
                SizedBox(
                  height: 30,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      print("Home tab clicked");
                    },
                    child: Ink(
                        child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/learn_namaz.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/bottom.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: Text(
                                "Фото и видео образцы намаза, чтобы вы могли \n быстро и легко научиться читать намаз",
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white)),
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                HelpProjectWidget(),
                SizedBox(
                  height: 10,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: NamazTime(),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ImageStatePage(),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 17, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(image: AssetImage('assets/icons/time.png')),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Время молитв",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_right)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(52, 10, 15, 10),
                          child: Divider(color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 17, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(
                                  image: AssetImage('assets/icons/sounds.png')),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Уведомления и Звук",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_right)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(52, 10, 15, 10),
                          child: Divider(color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 17, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(
                                  image: AssetImage('assets/icons/global.png')),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Язык",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_right)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(52, 10, 15, 10),
                          child: Divider(color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 17, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(image: AssetImage('assets/icons/icon.png')),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Пол",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_right)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(52, 10, 15, 0),
                          child: Divider(color: Colors.transparent),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Visibility(
                    visible: false,
                    child: Text('Ndini uya uya'),
                    //maintainSize: bool. When true this is equivalent to invisible;
                    //replacement: Widget. Defaults to Sizedbox.shrink, 0x0
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
