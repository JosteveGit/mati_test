import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mati_plugin_flutter/mati_plugin_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    MatiFlutter.resultCompleter.future.then((result) => Fluttertoast.showToast(
        msg: result is ResultSuccess
            ? "Success ${result.verificationId}"
            : "Cancelled",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM));
    super.initState();
  }

  void showMatiFlow() {
    MatiFlutter.showMatiFlow("60dcb2ec0d9664001b28fd59", "60dcb2ec0d9664001b28fd58", {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mati flutter plugin demo"),
        ),
        body: Center(
            child: ElevatedButton(
          onPressed: showMatiFlow,
          child: const Text('Verify me'),
        )));
  }
}
