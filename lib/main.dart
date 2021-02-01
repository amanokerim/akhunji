import 'package:akhunji/views/homeV.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/homeP.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ak Hünji',
      theme: ThemeData(
          // primarySwatch: Colors.black87,
          primaryColor: Colors.black,
          textTheme: TextTheme(
            bodyText2: TextStyle(
              fontSize: 18.0,
            ),
          )),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => HomeP(context),
        child: HomeV(),
      ),
    );
  }
}
