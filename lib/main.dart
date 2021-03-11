import 'package:flutter/material.dart';
import 'package:flutter_design/widgets/help_project.dart';
import 'package:flutter_design/widgets/namaz_time.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFE5E5E5)),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
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
                            image: AssetImage('assets/images/learn_namaz.png'),
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
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white)),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
