import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  List<TextEditingController> controller = [];
  List<TextEditingController> controller1 = [];
  List<TextEditingController> controller2 = [];

  void incrementCounter() {
    setState(() {
      counter++;
      controller.add(
          TextEditingController()); // Add a new controller for each counter increment
      controller1.add(TextEditingController());
      controller2.add(TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Table(border: TableBorder.all(color: Colors.black), children: [
            TableRow(children: [
              TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: EdgeInsets.all(10), child: Text("name1"))),
              TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: EdgeInsets.all(10), child: Text("name2"))),
              TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                      padding: EdgeInsets.all(10), child: Text("name3"))),
            ]),
            ...List.generate(counter, growable: true, (index) {
              return TableRow(children: [
                TableCell(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: controller[index],
                        ))),
                TableCell(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: controller1[index],
                        ))),
                TableCell(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: controller2[index],
                        ))),
              ]);
            })
          ])
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
