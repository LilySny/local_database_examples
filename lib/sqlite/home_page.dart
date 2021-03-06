import 'package:flutter/material.dart';
import 'package:local_database_examples/shared/name_dao.dart';
import 'package:local_database_examples/sqlite/dao/sqlite_dao.dart';
import 'package:local_database_examples/sqlite/model/name.dart';
import 'package:local_database_examples/shared/custom_drawer.dart';

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
        title: Text("NamesList - SQLite Example"),
      ),
      drawer: CustomDrawer(),
      body: _nameList(),
      floatingActionButton: _add(),
    );
  }

  Widget _nameList() {
    return FutureBuilder<List<Name>>(
        future: _nameDao.findAllNames(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot == null || snapshot.data.isEmpty) {
            return Center(
              child: Text("Name list is empty"),
            );
          }
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 10.0),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(snapshot.data[index].text));
            },
          );
        });
  }

  Widget _add() {
    return FloatingActionButton(
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
    );
  }
}
