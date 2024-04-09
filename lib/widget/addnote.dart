import 'package:flutter/material.dart';
import 'package:sqlite_flutter/models/model.dart';
import 'package:sqlite_flutter/repo/noterepo.dart';

class AddNote extends StatefulWidget {
  final notes? note;
  const AddNote({super.key, this.note });

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  @override
  void initState() {
  if(widget.note != null){
    title.text = widget.note!.Title;
    desc.text =widget.note!.Description;
  }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add note hear'),
        actions: [widget.note!=null? IconButton(onPressed: deletenote, icon: Icon(Icons.delete)):SizedBox(),IconButton(onPressed:widget.note ==null? insertNote:updatenote, icon: Icon(Icons.check))],
      ),
      body: ListView(padding: EdgeInsets.all(8),
        children: [
          TextFormField(controller: title,
            decoration: InputDecoration(
                hintText: 'Enter title data',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
          ),SizedBox(height: 8,),
           TextFormField(controller: desc,maxLines: 16,
            decoration: InputDecoration(
                hintText: 'Enter desc data',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
          )
        ],
      ),
    );
  }
  insertNote()async{
    final note = notes(Title: title.text, Description: desc.text, Create_at: DateTime.now());
  await  noterepo.Insert(note: note);
  }

  updatenote()async{
    final note = notes(Id: widget.note!.Id,Title: title.text, Description: desc.text, Create_at: widget.note!.Create_at);
  await  noterepo.update(note: note);
  }
   deletenote()async{
  await  noterepo.delete(note: widget.note!).then((e){
    Navigator.pop(context);

  });
  }
}
