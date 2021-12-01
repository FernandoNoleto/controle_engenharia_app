import 'package:flutter/material.dart';
import 'package:controle_engenharia/Common/app_card.dart';
import 'package:controle_engenharia/corposdeprovascreen.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var fontSize = 32.0;

  SnackBar warningMessage = SnackBar(
    content: const Text("Limite do tamanho da fonte alcançado!"),
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
      label: "Ok",
      onPressed: () {},
    ),
  );

  void upFontSize(double textSize) {
    setState(() {
      this.fontSize >= 42.0 ? ScaffoldMessenger.of(context).showSnackBar(warningMessage) : this.fontSize += 5.0;
    });
  }

  void downFontSize(double textSize) {
    setState(() {
      this.fontSize -= 5.0;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle Engenharia'),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              tooltip: "Diminutir fonte",
              onPressed: () { downFontSize(fontSize); },
              icon: const Icon(
                Icons.format_size,
                size: 18.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              tooltip: "Aumentar fonte",
              onPressed: () { upFontSize(fontSize); },
              icon: const Icon(
                Icons.format_size,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            AppCard(
              logo: Image(image: AssetImage('assets/icon/press.png')),
              title: Text(
                "Corpos de prova",
                style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Calcular fck, desvio padrão, coeficiente de variação...",
                style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return corposDeProvaScreen();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}








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