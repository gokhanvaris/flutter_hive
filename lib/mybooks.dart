import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'books.dart';

class MyBooks extends StatefulWidget {
  const MyBooks({Key? key}) : super(key: key);

  @override
  State<MyBooks> createState() => _MyBooksState();
}

class _MyBooksState extends State<MyBooks> {
  final _title = TextEditingController();
  final _author = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive DB"),
      ),
      body: ValueListenableBuilder(
        valueListenable:
            Hive.box<Books>('booksbox')
                .listenable(),
        builder: (context, Box<Books> box, _) {
          if (box.values.isEmpty) {
            return const Center(
                child: Text("No Books"));
          } else {
            return ListView.separated(
              itemCount: box.values.length,
              itemBuilder: (context, index) {
                var result = box.getAt(index);

                return Card(
                  child: ListTile(
                    title:
                        Text(result!.book_title!),
                    subtitle:
                        Text(result.book_author!),
                    trailing: InkWell(
                      child: const Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                      onTap: () {
                        box.deleteAt(index);
                      },
                    ),
                  ),
                );
              },
              separatorBuilder: (context, i) {
                return const SizedBox(height: 12);
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => addNewBook(context),
      ),
    );
  }

  addNewBook(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("New book"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _title,
                  decoration:
                      const InputDecoration(
                          hintText: 'Title'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _author,
                  decoration:
                      const InputDecoration(
                          hintText: 'Author'),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () async {
                      await box?.put(
                          DateTime.now()
                              .toString(),
                          Books(
                            book_title:
                                _title.text,
                            book_author:
                                _author.text,
                          ));

                      Navigator.pop(context);
                    },
                    child: const Text("Add")),
              ],
            ),
          );
        });
  }
}
