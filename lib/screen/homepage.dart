import 'package:flutter/material.dart';
import 'package:sqlite_flutter/repo/noterepo.dart';
import 'package:sqlite_flutter/widget/addnote.dart';
import 'package:sqlite_flutter/widget/items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNote()));
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
          future: noterepo.getnote(),
          builder: (context, Snapshot) {
            if (Snapshot.connectionState == ConnectionState.done) {
              if (Snapshot.data == null || Snapshot.data!.isEmpty) {
                return Center(
                  child: Text('Null'),
                );
              }
            return ListView(padding: EdgeInsets.all(8),children: [for(var note in Snapshot.data!)ItemNote(mote: note,)],);
            }
            else {
              return Container();
            }
          }),
      appBar: AppBar(actions: [IconButton(onPressed: (){setState(() {
        
      });}, icon: Icon(Icons.reset_tv))],
        title: Text('Todo App'),
      ),
    );
  }
}
