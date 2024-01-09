import 'package:flutter/material.dart';
import 'package:note_app/features/user/model/note_model.dart';
import 'package:note_app/features/user/viewmodels/note_viewmodel.dart';
import 'package:note_app/features/user/widgets/customtextfield.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {

  final _noteKey = GlobalKey<FormState>();
  TextEditingController titlecontroller =TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  @override
  void dispose() {
    titlecontroller.dispose();
    descriptioncontroller.dispose();
    super.dispose();
  }
  var uuid= Uuid();
  var id;
  @override
  void initState() {
    id= uuid.v1();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Notes",style: themeData.textTheme.displayLarge,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
        child: Form(
            key: _noteKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add new note:",style: themeData.textTheme.displayLarge,),
                SizedBox(height: 10,),
                CustomTextformfield(controller: titlecontroller, hintText: "title",inputType: TextInputType.text,),
                SizedBox(height: 20,),
                CustomTextformfield(controller: descriptioncontroller, hintText: "Description",inputType: TextInputType.multiline,),

                SizedBox(height: 30,),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: themeData.colorScheme.secondary
                    ),
                    onPressed: (){
                      if(_noteKey.currentState!.validate()){
                        NoteModel note=NoteModel(
                            id: id,
                            title: titlecontroller.text,
                            content: descriptioncontroller.text,
                            status: 1,
                            createdAt: DateTime.now()
                        );
                        Provider.of<NoteViewModel>(context,listen: false).addNotes(note).then((value){
                          Navigator.pop(context);
                        });
                      }
                    }, child: Text("Save",style: themeData.textTheme.titleMedium,))
              ],
            )
        ),
      ),
    );
  }
}