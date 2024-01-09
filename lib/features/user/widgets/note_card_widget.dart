import 'package:flutter/material.dart';
import 'package:note_app/features/user/model/note_model.dart';
import 'package:note_app/features/user/viewmodels/note_viewmodel.dart';
import 'package:provider/provider.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.themeData,
    required this.index,
    required this.note,
  });

  final ThemeData themeData;
  final int index;
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: ListTile(
        trailing: IconButton(
            onPressed: (){
              showDialog(context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("Confirm delete!",style: themeData.textTheme.displayLarge,),
                      content: Text("Are you sure you want to delete!?",style: themeData.textTheme.bodyMedium,),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        },
                            child: Text("Cancel",style: themeData.textTheme.bodySmall,)),
                        TextButton(onPressed: (){
                          Provider.of<NoteViewModel>(context,listen: false).deletenote(note).then((value){
                            Navigator.of(context).pop();
                          });
                        },
                            child: Text("Delete",style: themeData.textTheme.bodySmall,)),
                      ],
                    );
                  });
            },
            icon: Icon(Icons.delete)),
        leading: CircleAvatar(
          backgroundColor: themeData.colorScheme.secondary,
          child: Center(
            child: Text("${index+1}",style: themeData.textTheme.bodySmall,),

          ),
        ),
        title: Text("${note.title}",style: themeData.textTheme.titleLarge,),
        subtitle: Text("${note.content}",style: themeData.textTheme.titleMedium,),

      ),
    );
  }
}