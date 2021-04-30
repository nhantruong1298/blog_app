import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_project_flutter/modules/profile/screen/profile_screen.dart';
import 'package:pet_project_flutter/routes/routes_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(_) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: RoutesManager.listRoutes,
      title: 'Pet Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Stack(children: [
        Container(
            width: size.width,
            height: size.height * 0.4,
            decoration: BoxDecoration(
              color: Colors.blue[300].withOpacity(0.5),
            )),
        Container(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.42),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8.0, top: 2.0),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[400].withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 3)),
                        ],
                      ),
                      child: InkWell(
                        onTap: () => Get.to(() => ProfileScreen()),
                        child: Icon(
                          Icons.person,
                          color: Colors.blue[200],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8.0, top: 2.0),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[400].withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 3)),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.person,
                          color: Colors.blue[200],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
