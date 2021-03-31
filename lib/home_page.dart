import 'package:flutter/material.dart';
import 'package:local_database_examples/daos/name_dao.dart';
import 'package:local_database_examples/daos/sqlite_dao.dart';
import 'package:local_database_examples/models/name.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NameDao _nameDao;
  final _nameContent = TextEditingController();

  @override
  void initState() {
    _nameDao = SQLiteDao();
    super.initState();
  }

  @override
  void dispose() {
    _nameContent.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NamesList"),
      ),
      body: FutureBuilder<List<Name>>(
          future: _nameDao.findAllNames(),
          builder: (context, snapshot) {
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10.0),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(snapshot.data[index].text));
              },
            );
          }),
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
                        setState(() {
                          _nameDao
                              .saveName(Name(text: _nameContent.text))
                              .then((value) {
                            Navigator.of(context).pop();
                            _nameContent.text = "";
                          });
                        });
                      }),
                ],
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
