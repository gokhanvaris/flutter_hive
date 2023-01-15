import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'books.dart';
import 'mybooks.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('booksbox');
  Hive.registerAdapter(BooksAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: const MyBooks()),
    );
  }
}
