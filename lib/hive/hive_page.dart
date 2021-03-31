import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:local_database_examples/hive/model/hive_name.dart';
import 'package:local_database_examples/shared/custom_drawer.dart';
import 'package:local_database_examples/hive/hive_boxes.dart';

class HivePage extends StatefulWidget {
  HivePage({Key key}) : super(key: key);

  @override
  _HivePageState createState() => _HivePageState();
}

class _HivePageState extends State<HivePage> {
  final _nameContent = TextEditingController();

  @override
  void dispose() {
    Hive.close();
    _nameContent.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NamesList"),
      ),
      drawer: CustomDrawer(),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<HiveName>(HiveBoxes.names).listenable(),
        builder: (context, Box<HiveName> box, widget) {
          if (box.values == null || box.values.isEmpty)
            return Center(
              child: Text("Name list is empty"),
            );
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 10.0),
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              HiveName res = box.getAt(index);
              return Dismissible(
                background: Container(color: Colors.red),
                key: UniqueKey(),
                onDismissed: (direction) {
                  res.delete();
                },
                child: ListTile(
                  title: Text(res.name == null ? '' : res.name),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              child: AlertDialog(
                title: Text("Add Name"),
                content: TextField(
                  controller: _nameContent,
                ),
                actions: [
                  RaisedButton(
                      child: Text("Add"),
                      onPressed: () {
                        Box<HiveName> contactsBox =
                            Hive.box<HiveName>(HiveBoxes.names);
                        contactsBox
                            .add(HiveName(name: _nameContent.text))
                            .then((value) {
                          Navigator.of(context).pop();
                          _nameContent.text = "";
                        });
                      })
                ],
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
