import 'package:flutter/material.dart';
import 'package:note_app/core/services/theme_services.dart';
import 'package:note_app/features/user/view/add_note_view.dart';
import 'package:note_app/features/user/viewmodels/note_viewmodel.dart';
import 'package:note_app/features/user/widgets/note_card_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key

  });


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final themeData=Theme.of(context);


    return Scaffold(
      appBar: AppBar(
        title: Text("NotePad",style: themeData.textTheme.displayLarge,),
        actions: [
          Switch(
            trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
            activeColor: Colors.teal,
            activeTrackColor: Colors.tealAccent,
            value: Provider.of<ThemeServiceProvider>(context).isDarkModeOn,
            onChanged: (_){
              Provider.of<ThemeServiceProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, '/newnote');
      },
        child: Icon(Icons.add,color: Colors.white,),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("All notes",style: themeData.textTheme.displayLarge,),
            SizedBox(height: 15,),
            Expanded(
                child: Consumer<NoteViewModel>(
                    builder: (context, noteprovider, child){
                      if(noteprovider.notes.isEmpty){
                        return Center(
                          child: Text("No notes!",style: themeData.textTheme.bodySmall,)  ,
                        );
                      }
                      return ListView.builder(
                          itemCount: noteprovider.notes.length,
                          itemBuilder: (context,index){
                            return NoteCard(
                                themeData: themeData,
                                index: index,
                                note: noteprovider.notes[index]);
                          });
                    }))
          ],
        ),
      ),
    );
  }
}