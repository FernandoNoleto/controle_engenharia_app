import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:controle_engenharia/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Controle Engenharia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  var title;

  MyHomePage({Key? key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xffffffff), Color(0xff607d8b)],
        ),
        navigateAfterSeconds: Home(),
        loaderColor: Colors.transparent,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icon/icon.png"),
            fit: BoxFit.none,
          ),
        ),
      ),
    ],
  );
}

//
// void main() {
//   runApp(Home());
// }
//
//
// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Controle Engenharia'),
//         backgroundColor: Colors.blueGrey,
//       ),
//       body: Center(
//         child: ListView(
//           children: <Widget>[
//             AppCard(
//               title: Text(
//                 "Corpos de prova",
//                 style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(
//                 "Calcular fck, desvio padrão, coeficiente de variação...",
//                 style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
//               ),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) {
//                     return corposDeProvaScreen();
//                   }),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
