import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:collection/collection.dart';

import 'card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Page2(),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  var _itemsDescription = <String>['Fazer a tarefa de casa', 'Programar Flutter', 'Lavar a casa'];
  var _itemsChecked = <bool?>[false, false, false];

  final _controller = TextEditingController();

  void _onAdd() {
    setState(() {
      _itemsDescription.add(_controller.text);
      _itemsChecked.add(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Text(
              'To-Dos',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            ..._itemsDescription.mapIndexed((i, description) => _buildItem(i)).toList(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: _onAdd,
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(int i) {
    return Row(
      children: [
        Checkbox(
          value: _itemsChecked[i],
          onChanged: (value) {
            if (value == null) return;
            setState(() {
              _itemsChecked[i] = value;
            });
          },
        ),
        Text(_itemsDescription[i]),
      ],
    );
  }
}

///////

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  var _date = DateTime.now();
  void _onClick() {
    setState(() {
      _date = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build ${DateTime.now()}');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Data e Hora:', style: TextStyle()),
            Text(_date.toString(), style: TextStyle()),
            OutlinedButton(
              child: Text('Que horas são?'),
              onPressed: _onClick,
            ),
          ],
        ),
      ),
    );
  }
}
