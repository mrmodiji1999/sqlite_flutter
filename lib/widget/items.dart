import 'package:flutter/material.dart';
import 'package:sqlite_flutter/models/model.dart';
import 'package:sqlite_flutter/widget/addnote.dart';

class ItemNote extends StatefulWidget {
  final notes mote;

  const ItemNote({super.key,required this.mote});

  @override
  State<ItemNote> createState() => _ItemNoteState();
}

class _ItemNoteState extends State<ItemNote> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNote(note:widget.mote,)));},
        tileColor: Colors.amber,
        leading: Text('Dec\n22\n24'),
        title: Text(widget.mote.Title),
        subtitle: Text(widget.mote.Description),
        trailing: Text('1:22 pm'),
      ),
    );
  }
}
